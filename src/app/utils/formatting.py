import re
from typing import Any


_MULTIPLE_BLANK_LINES = re.compile(r"\n{3,}")
_TRAILING_SPACES = re.compile(r"[ \t]+\n")


def format_money(value: Any) -> str:
    if value is None:
        return "N/A"
    try:
        return f"{float(value):,.0f}đ"
    except (TypeError, ValueError):
        return str(value)


def clean_answer(text: str) -> str:
    """Normalize AI answer: strip, collapse blank lines, remove trailing spaces."""
    if not text:
        return ""
    cleaned = text.strip()
    cleaned = _TRAILING_SPACES.sub("\n", cleaned)
    cleaned = _MULTIPLE_BLANK_LINES.sub("\n\n", cleaned)
    return cleaned
