"""Amicable pairs: d(a) == b and d(b) == a with a != b."""


def d(n):
    return sum(i for i in range(1, n) if n % i == 0)


def amicable_pairs(limit):
    for a in range(2, limit):
        b = d(a)
        if b > a and d(b) == a:
            yield a, b


print(list(amicable_pairs(1500)))
