def tau(n):
    return sum(1 for d in range(1, n + 1) if n % d == 0)


refactorable = [n for n in range(1, 60) if n % tau(n) == 0]
print(refactorable)  # [1, 2, 8, 9, 12, 18, 24, 36, 40, 56]
