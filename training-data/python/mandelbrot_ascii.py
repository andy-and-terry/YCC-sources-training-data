def escape(c: complex, limit: int = 30) -> int:
    z = 0j
    for n in range(limit):
        if abs(z) > 2:
            return n
        z = z * z + c
    return limit


for yi in range(-5, 6):
    print("".join("#" if escape(complex(x / 20, yi / 5)) == 30 else "." for x in range(-40, 13)))
