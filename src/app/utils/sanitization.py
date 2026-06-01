"""User-input sanitization to defend against prompt injection.

This module is intentionally conservative: it never *rejects* input on the
behalf of the API layer. Instead it returns a sanitized string plus a flag
so the caller can decide how to react (e.g. add a stronger reminder section
in the prompt). Hard-blocking is left to the LLM safety settings + the
output validator.
"""

from __future__ import annotations

import re
import unicodedata
from dataclasses import dataclass


# Patterns commonly used in prompt-injection / jailbreak attempts.
# Patterns are matched against accent-stripped, lower-cased text (see
# ``_normalize_for_match``) so they don't need the ``re.I`` flag and the
# Vietnamese rules can be written in ASCII form.
_INJECTION_PATTERNS: tuple[re.Pattern[str], ...] = (
    re.compile(r"ignore (all|any|previous|above|prior) (instructions?|rules?|prompts?)"),
    re.compile(r"disregard (all|any|previous|above|prior) (instructions?|rules?|prompts?)"),
    re.compile(r"forget (all|everything|previous|prior) (instructions?|rules?|prompts?)?"),
    re.compile(r"you (are|will be) (now |from now on )?(a |an )?(?:dan|jailbroken|developer mode|admin)"),
    re.compile(r"(reveal|show|print|leak|dump) (the |your )?(system|hidden|secret|initial) prompt"),
    re.compile(r"act as (a |an )?(?:dan|admin|developer|root|hacker)"),
    re.compile(r"</?(system|assistant|developer)\b[^>]*>"),
    # Vietnamese (matched against accent-stripped form).
    re.compile(r"bo qua (moi|tat ca|cac|nhung)? ?(huong dan|chi dan|quy tac|prompt|chi thi)"),
    re.compile(r"quen (di|het|tat ca)? ?(huong dan|chi dan|quy tac|prompt)"),
    re.compile(r"(tiet lo|hien thi|in ra|cho xem) (system|prompt|chi thi|huong dan g(o|oc)c?)"),
    re.compile(r"ban bay gio la (dan|admin|hacker|nha phat trien)"),
    re.compile(r"dong vai (dan|admin|hacker|nha phat trien|nguoi khac)"),
)


# Control characters except common whitespace (\t \n \r). Removing zero-width
# joiners and bidi marks blocks a class of homoglyph / hidden-char injection.
_CONTROL_CHARS = re.compile(
    r"[\x00-\x08\x0b\x0c\x0e-\x1f\x7f\u200b-\u200f\u202a-\u202e\u2060-\u206f\ufeff]"
)


@dataclass(frozen=True)
class SanitizedInput:
    text: str
    was_suspicious: bool
    reasons: tuple[str, ...]


def _normalize_for_match(value: str) -> str:
    """Lower-case and strip Vietnamese accents for pattern matching only."""
    folded = unicodedata.normalize("NFD", value.lower())
    no_accent = "".join(ch for ch in folded if unicodedata.category(ch) != "Mn")
    return no_accent.replace("đ", "d")


def sanitize_user_input(text: str, *, max_length: int = 2000) -> SanitizedInput:
    """Strip dangerous characters and detect injection patterns.

    The returned ``text`` is safe to embed inside a prompt (no control chars,
    bounded length, role-tags removed). ``was_suspicious`` is True when an
    injection pattern is detected so callers can add an extra reminder.
    """
    if not text:
        return SanitizedInput(text="", was_suspicious=False, reasons=())

    # 1. Remove control / zero-width / bidi characters.
    cleaned = _CONTROL_CHARS.sub("", text)

    # 2. Strip stray role tags so they cannot fake a system message.
    cleaned = re.sub(r"</?(system|assistant|developer|user)\b[^>]*>", "", cleaned, flags=re.I)

    # 3. Collapse repeated whitespace (keeps single newlines).
    cleaned = re.sub(r"[ \t]+", " ", cleaned)
    cleaned = re.sub(r"\n{3,}", "\n\n", cleaned).strip()

    # 4. Bound length (Pydantic also enforces 2000, this is a safety net).
    if len(cleaned) > max_length:
        cleaned = cleaned[:max_length].rstrip()

    # 5. Detect injection attempts on the normalized version.
    normalized = _normalize_for_match(cleaned)
    reasons: list[str] = []
    for pattern in _INJECTION_PATTERNS:
        if pattern.search(normalized):
            reasons.append(pattern.pattern)

    return SanitizedInput(
        text=cleaned,
        was_suspicious=bool(reasons),
        reasons=tuple(reasons),
    )
