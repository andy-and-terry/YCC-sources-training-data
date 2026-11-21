# Cantor pairing function: a bijection between N x N and N.
from math import isqrt

def pair(x, y):
    return (x + y) * (x + y + 1) // 2 + y

def unpair(z):
    w = (isqrt(8 * z + 1) - 1) // 2
    y = z - w * (w + 1) // 2
    return w - y, y

print(pair(3, 4))
print(*unpair(32))
