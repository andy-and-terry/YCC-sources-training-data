# Cake numbers: max pieces from n plane cuts of a cube, (n^3 + 5n + 6) / 6.
print(*[(n ** 3 + 5 * n + 6) // 6 for n in range(10)])
