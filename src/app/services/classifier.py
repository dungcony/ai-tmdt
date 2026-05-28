import re

from app.models import ExtractedEntities, IntentName, IntentResult
from app.services.gemini_client import INTENT_RESPONSE_SCHEMA, GeminiClient
from app.services.prompts import INTENT_SYSTEM_PROMPT
from app.utils.text import normalize_text


INTENT_KEYWORDS: dict[IntentName, list[str]] = {
    "product_search": [
        "sản phẩm",
        "áo",
        "quần",
        "giày",
        "dép",
        "túi",
        "mũ",
        "nón",
        "có không",
        "tìm",
        "xem",
        "mua",
        "giá",
        "size",
        "màu",
        "hàng",
        "còn",
    ],
    "order_status": [
        "đơn hàng",
        "mã đơn",
        "order",
        "vận chuyển",
        "shipper",
        "tracking",
        "ord-",
        "đến chưa",
        "hủy đơn",
    ],
    "cart_info": [
        "giỏ hàng",
        "cart",
        "thanh toán",
        "checkout",
        "tổng tiền",
        "xóa",
        "thêm vào giỏ",
    ],
    "voucher_info": [
        "voucher",
        "mã giảm giá",
        "coupon",
        "khuyến mãi",
        "discount",
        "ưu đãi",
    ],
    "product_review": [
        "đánh giá",
        "review",
        "nhận xét",
        "bình luận",
        "có tốt không",
        "chất lượng",
        "mọi người nói",
    ],
    "general": [
        "chính sách",
        "đổi trả",
        "bảo hành",
        "hotline",
        "liên hệ",
        "shop ở đâu",
        "giao hàng bao lâu",
        "mấy ngày",
    ],
}


BRANDS = ["nike", "adidas", "uniqlo", "zara", "h&m", "coolmate", "vans", "converse"]
CATEGORIES = ["áo", "quần", "giày", "dép", "túi", "mũ", "nón"]
KEYWORD_CONFIDENCE_THRESHOLD = 0.6


def extract_entities(question: str) -> ExtractedEntities:
    lower = question.lower()
    normalized = normalize_text(question)
    entities = ExtractedEntities()

    order_code = re.search(r"\bORD-[\w-]+\b", question, re.IGNORECASE)
    if order_code:
        entities.order_code = order_code.group().upper()

    size_match = re.search(r"\b(S|M|L|XL|XXL|XXXL|\d{2})\b", question, re.IGNORECASE)
    if size_match:
        entities.size = size_match.group().upper()

    for brand in BRANDS:
        if brand in lower:
            entities.brand = brand.upper()
            break

    for category in CATEGORIES:
        if category in lower or normalize_text(category) in normalized:
            entities.category = category
            break

    product_match = re.search(
        r"(?:tìm|xem|mua|có|cho tôi xem|review|đánh giá)\s+(.+?)(?:\s+size|\s+màu|\s+không|\?|$)",
        lower,
    )
    if product_match:
        product_name = product_match.group(1).strip(" .,!?")
        if product_name and product_name not in {"sản phẩm", "hàng"}:
            entities.product_name = product_name
    else:
        normalized_match = re.search(
            r"(?:tim|xem|mua|co|cho toi xem|review|danh gia)\s+(.+?)(?:\s+size|\s+mau|\s+khong|\?|$)",
            normalized,
        )
        if normalized_match:
            product_name = normalized_match.group(1).strip(" .,!?")
            if product_name and product_name not in {"san pham", "hang"}:
                entities.product_name = product_name

    return entities


def classify_by_keywords(question: str) -> IntentResult:
    lower = question.lower()
    normalized = normalize_text(question)
    scores: dict[IntentName, int] = {}

    for intent, keywords in INTENT_KEYWORDS.items():
        hit = sum(
            1
            for keyword in keywords
            if keyword in lower or normalize_text(keyword) in normalized
        )
        if hit:
            scores[intent] = hit

    if not scores:
        return IntentResult(
            intent="general",
            confidence=0.3,
            extracted=extract_entities(question),
            reason="Không khớp keyword rõ ràng",
            source="keyword",
        )

    best_intent = max(scores, key=scores.get)
    confidence = min(scores[best_intent] / 3, 1.0)
    return IntentResult(
        intent=best_intent,
        confidence=confidence,
        extracted=extract_entities(question),
        reason=f"Khớp {scores[best_intent]} keyword",
        source="keyword",
    )


async def classify_intent(question: str, gemini: GeminiClient) -> IntentResult:
    keyword_result = classify_by_keywords(question)
    if keyword_result.confidence >= KEYWORD_CONFIDENCE_THRESHOLD:
        return keyword_result

    try:
        llm_result = await gemini.generate_json(
            INTENT_SYSTEM_PROMPT,
            question,
            response_schema=INTENT_RESPONSE_SCHEMA,
            max_tokens=256,
        )
        return IntentResult.model_validate({**llm_result, "source": "gemini"})
    except Exception:
        keyword_result.source = "fallback"
        return keyword_result
