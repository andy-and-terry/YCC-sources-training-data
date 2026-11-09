from abc import ABC, abstractmethod


class Shape(ABC):
    @abstractmethod
    def area(self) -> float: ...


class Sq(Shape):
    def __init__(self, s: float):
        self.s = s

    def area(self) -> float:
        return self.s ** 2


print(Sq(3).area())
try:
    Shape()
except TypeError as e:
    print("cannot instantiate:", e)
