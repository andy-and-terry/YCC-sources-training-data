import functools


def factorial_recursive(n: int) -> int:
    return 1 if n <= 1 else n * factorial_recursive(n - 1)


def factorial_iterative(n: int) -> int:
    result = 1
    for i in range(2, n + 1):
        result *= i
    return result


factorial_reduce = lambda n: functools.reduce(lambda a, b: a * b, range(1, n + 1), 1)


if __name__ == "__main__":
    print(factorial_recursive(5), factorial_iterative(5), factorial_reduce(5))
