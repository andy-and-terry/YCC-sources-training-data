# Repunits: R_k = (10**k - 1) / 9, built iteratively as r = 10r + 1.
r = 0
out = []
for _ in range(8):
    r = r * 10 + 1
    out.append(r)
print(*out)
