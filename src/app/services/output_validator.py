"""Output guardrail: validate AI answer against the context we provided.

The validator catches the most common hallucination class for an e-commerce
chatbot: the model invents a price, product code, or stock number that does
not appear in the system context.

Design notes:
- We only flag claims with concrete numbers/codes — generic prose is left
  alone so the bot can still ask follow-up questions or apologize.
- Validation is *advisory*: it returns a result object. The route decides
  whether to fall back, log, or pass the answer through.
"""

from __future__ import annotations

import re
from dataclasses import dataclass


# Matches "299,000đ", "299.000 đ", "1.290.000đ", "590000đ" etc.
_PRICE_PATTERN = re.compile(r"\d{1,3}(?:[.,]\d{3})+\s*đ|\d{4,}\s*đ", re.IGNORECASE)

# Matches things that look like product codes: 3+ uppercase letters/digits,
# optionally with dashes (e.g. "SP-001", "NIKE-AF1", "AB123"). Plain numbers
# are excluded to avoid false positives on quantities. We additionally require
# the token to contain *both* a letter and a digit (or a dash) so that pure
# words like "SALE", "FREESHIP", "NIKE" are not mis-classified as SKUs.
_CODE_PATTERN = re.compile(r"\b[A-Z][A-Z0-9]{2,}(?:-[A-Z0-9]+)*\b")
_HAS_DIGIT_OR_DASH = re.compile(r"[\d\-]")


@dataclass(frozen=True)
class ValidationResult:
    is_valid: bool
    hallucinated_prices: tuple[str, ...]
    hallucinated_codes: tuple[str, ...]

    @property
    def reason(self) -> str:
        parts: list[str] = []
        if self.hallucinated_prices:
            parts.append(f"prices_not_in_context={list(self.hallucinated_prices)}")
        if self.hallucinated_codes:
            parts.append(f"codes_not_in_context={list(self.hallucinated_codes)}")
        return "; ".join(parts) or "ok"


def _normalize_price(token: str) -> str:
    """Strip separators so '299,000đ' and '299.000đ' compare equal."""
    digits = re.sub(r"[^\d]", "", token)
    return digits


def validate_answer(answer: str, context: str) -> ValidationResult:
    """Return a result describing whether the answer is grounded in context.

    An answer is considered valid when every concrete price and product code
    it mentions also appears in the provided context. If the context is
    empty, the answer must not contain any concrete prices or codes — it
    should instead ask the user for more information.
    """
    if not answer:
        return ValidationResult(True, (), ())

    answer_prices = _PRICE_PATTERN.findall(answer)
    raw_codes = _CODE_PATTERN.findall(answer)

    # 1. Allow-list common acronyms / labels that aren't real product codes.
    allow_codes = {
        "AI", "VND", "VNĐ", "HSD", "SKU", "API", "ID", "OK", "OTP", "HCM", "HN",
        "SALE", "OFF", "NEW", "HOT", "COD", "VAT", "GTGT", "FREESHIP", "SHIP",
        "XS", "SS", "MM", "LL", "XL", "XXL", "XXXL", "USD", "EUR", "JPY",
    }
    # 2. Real SKUs almost always contain a digit or dash; pure-letter tokens
    #    like brand names ("NIKE", "ADIDAS") are dropped to avoid false flags.
    answer_codes = [
        c for c in raw_codes
        if c not in allow_codes and _HAS_DIGIT_OR_DASH.search(c)
    ]

    if not answer_prices and not answer_codes:
        return ValidationResult(True, (), ())

    context_text = context or ""
    context_price_keys = {_normalize_price(p) for p in _PRICE_PATTERN.findall(context_text)}
    context_codes_upper = context_text.upper()

    bad_prices = tuple(
        p for p in answer_prices if _normalize_price(p) not in context_price_keys
    )
    bad_codes = tuple(
        c for c in answer_codes if c.upper() not in context_codes_upper
    )

    return ValidationResult(
        is_valid=not (bad_prices or bad_codes),
        hallucinated_prices=bad_prices,
        hallucinated_codes=bad_codes,
    )
