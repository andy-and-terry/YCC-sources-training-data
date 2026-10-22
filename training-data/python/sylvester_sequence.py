# Sylvester's sequence: s(0) = 2, s(n+1) = s(n)^2 - s(n) + 1
s = 2
for i in range(8):
    print(f"s({i}) = {s}")
    s = s * s - s + 1
