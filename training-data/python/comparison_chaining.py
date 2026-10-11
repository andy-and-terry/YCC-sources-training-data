x = 5
print(1 < x < 10, 1 < x < 3, 10 > x >= 5)
print(1 == 1.0 == True)

def noisy(n):
    print("eval", n)
    return n


# middle expression is evaluated only once
print(0 < noisy(5) < 10)

# short circuit
print(5 < 3 < noisy(99))

a = b = [1, 2]
print(a is b, a == [1, 2], a is [1, 2])
print("a" < "b" < "c", (1, 2) < (1, 3))
