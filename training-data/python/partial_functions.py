from functools import partial, partialmethod


def power(base, exp):
    return base ** exp


square = partial(power, exp=2)
cube = partial(power, exp=3)
print(square(5), cube(2))

two_to = partial(power, 2)
print([two_to(n) for n in range(5)])
print(square.func.__name__, square.args, square.keywords)

int_from_bin = partial(int, base=2)
print(int_from_bin("1011"))


class Cell:
    def __init__(self):
        self.value = 0

    def set_to(self, v):
        self.value = v

    reset = partialmethod(set_to, 0)
    set_ten = partialmethod(set_to, 10)


c = Cell()
c.set_ten()
print(c.value)
c.reset()
print(c.value)
