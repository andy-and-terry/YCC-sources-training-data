def is_armstrong(n):
    digits = str(n)
    return n == sum(int(d) ** len(digits) for d in digits)


print([n for n in range(1, 1000) if is_armstrong(n)])
# [1, 2, 3, 4, 5, 6, 7, 8, 9, 153, 370, 371, 407]
