# Narayana's cows: N(0) = N(1) = N(2) = 1, N(n) = N(n-1) + N(n-3)
n = [1, 1, 1]
for i in range(3, 15):
    n.append(n[i - 1] + n[i - 3])
print(" ".join(map(str, n)))
