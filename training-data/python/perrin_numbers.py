# Perrin numbers: P(0) = 3, P(1) = 0, P(2) = 2, P(n) = P(n-2) + P(n-3)
p = [3, 0, 2]
for n in range(3, 15):
    p.append(p[n - 2] + p[n - 3])
print(" ".join(map(str, p)))
