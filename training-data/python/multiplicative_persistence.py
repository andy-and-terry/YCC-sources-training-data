def persistence(n):
    steps = 0
    while n >= 10:
        product = 1
        while n:
            product *= n % 10
            n //= 10
        n = product
        steps += 1
    return steps


for n in (39, 77, 999, 10):
    print(n, persistence(n))
