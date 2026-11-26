# Squarefree numbers: no prime square divides n. There are 61 up to 100.
def squarefree(n):
    d = 2
    while d * d <= n:
        if n % (d * d) == 0:
            return False
        d += 1
    return True

print(sum(squarefree(n) for n in range(1, 101)))
