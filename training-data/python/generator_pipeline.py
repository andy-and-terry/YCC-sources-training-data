def read_numbers(items):
    yield from items


def filter_even(numbers):
    return (n for n in numbers if n % 2 == 0)


def square(numbers):
    return (n * n for n in numbers)


def pipeline(items):
    return square(filter_even(read_numbers(items)))


if __name__ == "__main__":
    print(list(pipeline(range(10))))
