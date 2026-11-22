# Lazy caterer's sequence: max pieces from n straight cuts of a pancake,
# n(n+1)/2 + 1.
print(*[n * (n + 1) // 2 + 1 for n in range(10)])
