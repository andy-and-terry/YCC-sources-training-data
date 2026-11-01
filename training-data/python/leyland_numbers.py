# Leyland numbers: x**y + y**x for integers x >= y >= 2.
def leyland(x, y):
    return x ** y + y ** x

vals = [leyland(x, y) for x in range(2, 5) for y in range(2, x + 1)]
print(*vals)  # 8 17 54 32 145 512
