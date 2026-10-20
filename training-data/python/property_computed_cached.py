from functools import cached_property


class Circle:
    def __init__(self, r):
        self.r = r

    @cached_property
    def area(self):
        print("computing")
        return 3.14159 * self.r ** 2


if __name__ == "__main__":
    c = Circle(2)
    print(c.area, c.area)
