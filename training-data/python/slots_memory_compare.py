import sys

class Plain:
    def __init__(self):
        self.a = 1
        self.b = 2

class Slotted:
    __slots__ = ("a", "b")
    def __init__(self):
        self.a = 1
        self.b = 2

print(hasattr(Plain(), "__dict__"), hasattr(Slotted(), "__dict__"))
