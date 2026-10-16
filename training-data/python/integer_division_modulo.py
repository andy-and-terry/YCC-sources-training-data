print(7 // 2, -7 // 2, 7 // -2, -7 // -2)
print(7 % 3, -7 % 3, 7 % -3, -7 % -3)
print(divmod(17, 5), divmod(-17, 5))
print(7.5 // 2, 7.5 % 2)
print(int(-3.7), round(-3.7), round(2.5), round(3.5), round(2.675, 2))

import math
print(math.floor(-3.2), math.ceil(-3.2), math.trunc(-3.2))
print(math.isclose(0.1 + 0.2, 0.3), 0.1 + 0.2 == 0.3)
print(2 ** -1, 2 ** 100, pow(3, 4, 5))
# floor-division identity: a == (a // b) * b + a % b
a, b = -23, 5
print(a == (a // b) * b + a % b)
