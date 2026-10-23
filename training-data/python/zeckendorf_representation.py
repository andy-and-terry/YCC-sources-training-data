def zeckendorf(n):
    fibs = [1, 2]
    while fibs[-1] <= n:
        fibs.append(fibs[-1] + fibs[-2])
    parts = []
    for f in reversed(fibs):
        if f <= n:
            parts.append(f)
            n -= f
    return parts


print(*zeckendorf(100))
