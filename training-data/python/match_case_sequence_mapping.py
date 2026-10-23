def describe(value):
    match value:
        case []:
            return "empty list"
        case [x]:
            return f"one item {x}"
        case [first, *rest]:
            return f"first {first}, {len(rest)} more"
        case {"type": "circle", "r": r}:
            return f"circle {r}"
        case int() | float() if value < 0:
            return "negative number"
        case str() as s:
            return f"string {s!r}"
        case _:
            return "other"


for v in [[], [1], [1, 2, 3], {"type": "circle", "r": 2}, -4, "hi", None]:
    print(describe(v))
