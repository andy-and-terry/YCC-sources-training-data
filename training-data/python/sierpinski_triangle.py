n = 8
for r in range(n):
    print(" " * (n - r - 1) + "".join("* " if r & c == c else "  " for c in range(r + 1)))
