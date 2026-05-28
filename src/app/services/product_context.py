import re

from app.utils.text import normalize_text


SEASON_CATEGORY_MAP: dict[str, list[str]] = {
    "hè": ["áo thun", "áo polo", "áo", "dép", "sandal", "quần short", "đầm", "váy", "mũ", "nón"],
    "đông": ["áo khoác", "hoodie", "áo len", "quần dài", "giày"],
    "mưa": ["áo khoác gió", "giày", "dép", "sandal"],
    "tết": ["áo sơ mi", "quần tây", "váy", "đầm", "giày"],
    "noel": ["áo len", "hoodie", "áo khoác"],
    "đi học": ["balo", "giày", "áo thun", "áo sơ mi"],
    "công sở": ["áo sơ mi", "quần tây", "váy", "giày"],
    "thể thao": ["áo thun", "quần short", "giày", "sneaker"],
    "du lịch": ["áo thun", "quần short", "dép", "sandal", "mũ", "nón"],
    "dự tiệc": ["đầm", "váy", "áo sơ mi", "giày"],
}

CONTEXT_ALIASES: dict[str, list[str]] = {
    "hè": ["hè", "mùa hè", "mua he", "nắng nóng", "nang nong", "đi biển", "di bien", "biển", "bien"],
    "đông": ["đông", "mùa đông", "mua dong", "trời lạnh", "troi lanh", "rét", "ret"],
    "mưa": ["mưa", "trời mưa", "troi mua", "mùa mưa", "mua mua"],
    "tết": ["tết", "tet", "năm mới", "nam moi", "xuân", "xuan"],
    "noel": ["noel", "giáng sinh", "giang sinh"],
    "đi học": ["đi học", "di hoc", "khai giảng", "khai giang", "đến trường", "den truong"],
    "công sở": ["công sở", "cong so", "văn phòng", "van phong", "đi làm", "di lam"],
    "thể thao": ["thể thao", "the thao", "gym", "chạy bộ", "chay bo", "tập luyện", "tap luyen"],
    "du lịch": ["du lịch", "du lich", "đi chơi", "di choi", "dã ngoại", "da ngoai"],
    "dự tiệc": ["dự tiệc", "du tiec", "party", "sinh nhật", "sinh nhat"],
}

_EXACT_WORD_RE = re.compile(r"[^\W_]+", re.UNICODE)
_NORMALIZED_WORD_RE = re.compile(r"[a-z0-9]+")
_AMBIGUOUS_NORMALIZED_SINGLE_WORDS = {"mua"}


def _words(value: str) -> list[str]:
    return _EXACT_WORD_RE.findall(value.casefold())


def _normalized_words(value: str) -> list[str]:
    return _NORMALIZED_WORD_RE.findall(normalize_text(value))


def _contains_words(words: list[str], phrase_words: list[str]) -> bool:
    if not phrase_words or len(phrase_words) > len(words):
        return False

    phrase_length = len(phrase_words)
    return any(
        words[index : index + phrase_length] == phrase_words
        for index in range(len(words) - phrase_length + 1)
    )


def contains_phrase(value: str, phrase: str) -> bool:
    """Match full words, with accent-insensitive fallback for non-ambiguous terms."""
    if _contains_words(_words(value), _words(phrase)):
        return True

    normalized_phrase = _normalized_words(phrase)
    if (
        len(normalized_phrase) == 1
        and normalized_phrase[0] in _AMBIGUOUS_NORMALIZED_SINGLE_WORDS
    ):
        return False

    return _contains_words(_normalized_words(value), normalized_phrase)


def detect_season_context(question: str) -> list[str]:
    """Return suggested product categories for seasonal and shopping-occasion questions."""
    categories: list[str] = []
    for context, aliases in CONTEXT_ALIASES.items():
        if any(contains_phrase(question, alias) for alias in aliases):
            categories.extend(SEASON_CATEGORY_MAP[context])

    return list(dict.fromkeys(categories))
