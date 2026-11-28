def is_automorphic(n):
    return str(n * n).endswith(str(n))


print([n for n in range(0, 1000) if is_automorphic(n)])
# [0, 1, 5, 6, 25, 76, 376, 625]
