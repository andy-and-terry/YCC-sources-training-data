"""Method resolution order (C3 linearization) with cooperative super()."""


class Base:
    def greet(self):
        return ["Base"]


class Left(Base):
    def greet(self):
        return ["Left"] + super().greet()


class Right(Base):
    def greet(self):
        return ["Right"] + super().greet()


class Child(Left, Right):
    def greet(self):
        return ["Child"] + super().greet()


def main():
    print([cls.__name__ for cls in Child.__mro__])
    print(Child().greet())
    # super() in Left continues to Right, not Base, because of the MRO.
    print(Left().greet())

    try:
        class Broken(Base, Left):  # inconsistent: Base before its subclass
            pass
    except TypeError as exc:
        print("TypeError:", exc)


if __name__ == "__main__":
    main()
