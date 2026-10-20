from functools import partial

power = lambda base, exp: base ** exp
square = partial(power, exp=2)
cube = partial(power, exp=3)

if __name__ == "__main__":
    print(square(7), cube(3))
