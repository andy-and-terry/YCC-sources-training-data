def describe(x):
    match x:
        case []:
            return "empty"
        case [a]:
            return f"one: {a}"
        case [a, *rest]:
            return f"first {a}, {len(rest)} more"
        case {"type": t}:
            return f"typed {t}"
        case int() | float():
            return "number"
        case _:
            return "other"


for v in ([], [1], [1, 2, 3], {"type": "x"}, 3.5, "s"):
    print(describe(v))
