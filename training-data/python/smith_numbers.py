def digit_sum(n):
    return sum(int(c) for c in str(n))


def factor_digit_sum(n):
    total, d = 0, 2
    while n > 1:
        while n % d == 0:
            total += digit_sum(d)
            n //= d
        d += 1
    return total


def is_smith(n):
    is_prime = all(n % d for d in range(2, int(n**0.5) + 1))
    return n > 1 and not is_prime and digit_sum(n) == factor_digit_sum(n)


print(*(n for n in range(2, 100) if is_smith(n)))
