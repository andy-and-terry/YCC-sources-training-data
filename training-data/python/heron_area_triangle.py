import math


def heron(a, b, c):
    if a + b <= c or a + c <= b or b + c <= a:
        raise ValueError("sides violate the triangle inequality")
    s = (a + b + c) / 2
    return math.sqrt(s * (s - a) * (s - b) * (s - c))


print(heron(3, 4, 5))
try:
    heron(1, 2, 10)
except ValueError as e:
    print("error:", e)
