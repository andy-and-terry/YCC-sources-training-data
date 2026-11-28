def is_happy(n):
    seen = set()
    while n != 1 and n not in seen:
        seen.add(n)
        n = sum(int(d) ** 2 for d in str(n))
    return n == 1


found = [n for n in range(1, 40) if is_happy(n)]
print(found)  # [1, 7, 10, 13, 19, 23, 28, 31, 32, 44]
