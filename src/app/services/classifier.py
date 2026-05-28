import re

from app.models import ExtractedEntities, IntentName, IntentResult
from app.services.gemini_client import INTENT_RESPONSE_SCHEMA, GeminiClient
from app.services.product_context import (
    SEASON_CATEGORY_MAP,
    contains_phrase,
    detect_season_context,
)
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
        "gợi ý",
        "đề xuất",
        "phù hợp",
        "mùa",
        "hè",
        "đông",
        "mưa",
        "mặc gì",
        "đi biển",
        "đi học",
        "đi làm",
        "du lịch",
        "dự tiệc",
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
PRODUCT_TERMS = list(
    dict.fromkeys(
        [
            *CATEGORIES,
            "áo thun",
            "áo polo",
            "áo sơ mi",
            "áo khoác",
            "áo khoác gió",
            "áo len",
            "hoodie",
            "quần short",
            "quần dài",
            "quần tây",
            "sandal",
            "sneaker",
            "váy",
            "đầm",
            "balo",
            *[
                category
                for categories in SEASON_CATEGORY_MAP.values()
                for category in categories
            ],
        ]
    )
)
GENERIC_PRODUCT_NAMES = {"sản phẩm", "hàng", "đồ", "món", "item"}
PRODUCT_NAME_FILLER_WORDS = {
    "ban",
    "dua",
    "ra",
    "goi",
    "y",
    "de",
    "xuat",
    "vai",
    "mot",
    "so",
    "san",
    "pham",
    "hang",
    "do",
    "mon",
    "item",
    "hop",
    "ly",
    "phu",
    "trong",
    "cho",
    "mua",
    "he",
    "dong",
    "mua",
    "tet",
    "noel",
    "nay",
    "nua",
    "nao",
    "voi",
    "toi",
}


def _normalized_tokens(value: str) -> list[str]:
    return re.findall(r"[a-z0-9]+", normalize_text(value))


def _has_product_term(value: str) -> bool:
    return any(contains_phrase(value, term) for term in PRODUCT_TERMS)


def _is_only_brand(value: str) -> bool:
    normalized_value = " ".join(_normalized_tokens(value))
    return any(normalized_value == " ".join(_normalized_tokens(brand)) for brand in BRANDS)


def _is_clear_product_name(candidate: str, question: str) -> bool:
    candidate = candidate.strip(" .,!?")
    if not candidate:
        return False

    normalized_candidate = " ".join(_normalized_tokens(candidate))
    if normalized_candidate in {" ".join(_normalized_tokens(item)) for item in GENERIC_PRODUCT_NAMES}:
        return False
    if _is_only_brand(candidate):
        return False
    if not contains_phrase(question, candidate):
        return False
    if _has_product_term(candidate):
        return True
    if any(contains_phrase(candidate, brand) for brand in BRANDS):
        return True

    meaningful_tokens = [
        token
        for token in _normalized_tokens(candidate)
        if not token.isdigit()
    ]
    if len(meaningful_tokens) < 2:
        return False
    return bool(meaningful_tokens) and not all(
        token in PRODUCT_NAME_FILLER_WORDS for token in meaningful_tokens
    )


def _clean_product_name(candidate: str | None, question: str) -> str | None:
    if not candidate:
        return None

    product_name = candidate.strip(" .,!?")
    if not _is_clear_product_name(product_name, question):
        return None
    return product_name


def _sanitize_entities(question: str, entities: ExtractedEntities) -> ExtractedEntities:
    local_entities = extract_entities(question)
    cleaned = entities.model_copy()

    cleaned.product_name = _clean_product_name(cleaned.product_name, question)
    if cleaned.product_name is None:
        cleaned.product_name = local_entities.product_name

    if cleaned.brand and not contains_phrase(question, cleaned.brand):
        cleaned.brand = ""
    if not cleaned.brand:
        cleaned.brand = local_entities.brand

    if cleaned.category and not contains_phrase(question, cleaned.category):
        cleaned.category = ""
    if not cleaned.category:
        cleaned.category = local_entities.category

    if cleaned.size and not contains_phrase(question, cleaned.size):
        cleaned.size = ""
    if not cleaned.size:
        cleaned.size = local_entities.size

    if cleaned.order_code and not contains_phrase(question, cleaned.order_code):
        cleaned.order_code = ""
    if not cleaned.order_code:
        cleaned.order_code = local_entities.order_code

    return cleaned


def _with_question(result: IntentResult, question: str) -> IntentResult:
    result._question = question
    return result


def extract_entities(question: str) -> ExtractedEntities:
    normalized = normalize_text(question)
    entities = ExtractedEntities()

    order_code = re.search(r"\bORD-[\w-]+\b", question, re.IGNORECASE)
    if order_code:
        entities.order_code = order_code.group().upper()

    size_match = re.search(r"\b(S|M|L|XL|XXL|XXXL|\d{2})\b", question, re.IGNORECASE)
    if size_match:
        entities.size = size_match.group().upper()

    for brand in BRANDS:
        if contains_phrase(question, brand):
            entities.brand = brand.upper()
            break

    for category in CATEGORIES:
        if contains_phrase(question, category):
            entities.category = category
            break

    product_match = re.search(
        r"(?:tìm|xem|mua|có|cho tôi xem|review|đánh giá)\s+(.+?)(?:\s+size|\s+màu|\s+không|\?|$)",
        question,
        re.IGNORECASE,
    )
    if product_match:
        product_name = _clean_product_name(product_match.group(1), question)
        if product_name:
            entities.product_name = product_name
    else:
        normalized_match = re.search(
            r"(?:tim|xem|mua|co|cho toi xem|review|danh gia)\s+(.+?)(?:\s+size|\s+mau|\s+khong|\?|$)",
            normalized,
        )
        if normalized_match:
            product_name = _clean_product_name(normalized_match.group(1), normalized)
            if product_name:
                entities.product_name = product_name

    return entities


def classify_by_keywords(question: str) -> IntentResult:
    scores: dict[IntentName, int] = {}

    for intent, keywords in INTENT_KEYWORDS.items():
        hit = sum(1 for keyword in keywords if contains_phrase(question, keyword))
        if hit:
            scores[intent] = hit
    if detect_season_context(question) and (
        not scores or "product_search" in scores
    ):
        scores["product_search"] = max(scores.get("product_search", 0), 2)

    if not scores:
        return _with_question(
            IntentResult(
                intent="general",
                confidence=0.3,
                extracted=extract_entities(question),
                reason="Không khớp keyword rõ ràng",
                source="keyword",
            ),
            question,
        )

    best_intent = max(scores, key=scores.get)
    confidence = min(scores[best_intent] / 3, 1.0)
    return _with_question(
        IntentResult(
            intent=best_intent,
            confidence=confidence,
            extracted=extract_entities(question),
            reason=f"Khớp {scores[best_intent]} keyword",
            source="keyword",
        ),
        question,
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
        result = IntentResult.model_validate({**llm_result, "source": "gemini"})
        result.extracted = _sanitize_entities(question, result.extracted)
        return _with_question(result, question)
    except Exception:
        keyword_result.source = "fallback"
        return keyword_result
