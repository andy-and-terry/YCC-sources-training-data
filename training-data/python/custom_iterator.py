class Fibonacci:
    def __init__(self, limit: int):
        self.limit = limit

    def __iter__(self):
        a, b = 0, 1
        count = 0
        while count < self.limit:
            yield a
            a, b = b, a + b
            count += 1


class Range2D:
    def __init__(self, width, height):
        self.width = width
        self.height = height

    def __iter__(self):
        for y in range(self.height):
            for x in range(self.width):
                yield (x, y)


if __name__ == "__main__":
    print(list(Fibonacci(8)))
    print(list(Range2D(2, 2)))
