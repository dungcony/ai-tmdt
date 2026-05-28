from typing import Any


def format_money(value: Any) -> str:
    if value is None:
        return "N/A"
    try:
        return f"{float(value):,.0f}đ"
    except (TypeError, ValueError):
        return str(value)
