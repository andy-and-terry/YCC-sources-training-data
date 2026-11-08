class Plain:
    def __init__(self, a, b):
        self.a = a
        self.b = b


class Slotted:
    __slots__ = ("a", "b")

    def __init__(self, a, b):
        self.a = a
        self.b = b


if __name__ == "__main__":
    p, s = Plain(1, 2), Slotted(1, 2)
    print(hasattr(p, "__dict__"), hasattr(s, "__dict__"))
    try:
        s.c = 3
    except AttributeError as e:
        print("error:", e)
