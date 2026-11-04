def ordinal(n: int) -> str:
    if 11 <= n % 100 <= 13:
        return f"{n}th"
    return f"{n}{ {1: 'st', 2: 'nd', 3: 'rd'}.get(n % 10, 'th') }"


print(" ".join(ordinal(n) for n in (1, 2, 3, 4, 11, 12, 13, 21, 101, 111)))
