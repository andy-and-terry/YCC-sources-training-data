def alternating_digit_sum(n):
    total, sign = 0, 1
    while n > 0:
        total += sign * (n % 10)
        sign = -sign
        n //= 10
    return total


for n in (1234, 99999, 1000):
    print(n, alternating_digit_sum(n))
