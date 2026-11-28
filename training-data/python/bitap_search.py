def bitap(text: str, pat: str) -> int:
    """Shift-And exact match; returns first index or -1."""
    masks: dict[str, int] = {}
    for i, c in enumerate(pat):
        masks[c] = masks.get(c, 0) | (1 << i)
    state, goal = 0, 1 << (len(pat) - 1)
    for i, c in enumerate(text):
        state = ((state << 1) | 1) & masks.get(c, 0)
        if state & goal:
            return i - len(pat) + 1
    return -1


print(bitap("the quick brown fox", "brown"))
