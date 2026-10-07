"""abc.ABC / @abstractmethod: define an interface that cannot be
instantiated directly and forces subclasses to implement its
abstract methods."""

from abc import ABC, abstractmethod


class Shape(ABC):
    @abstractmethod
    def area(self) -> float:
        ...

    @abstractmethod
    def perimeter(self) -> float:
        ...

    def describe(self) -> str:
        """Concrete method built on top of the abstract ones."""
        return f"{type(self).__name__}: area={self.area():.2f}, perimeter={self.perimeter():.2f}"


class Rectangle(Shape):
    def __init__(self, width: float, height: float):
        self.width = width
        self.height = height

    def area(self) -> float:
        return self.width * self.height

    def perimeter(self) -> float:
        return 2 * (self.width + self.height)


class Circle(Shape):
    def __init__(self, radius: float):
        self.radius = radius

    def area(self) -> float:
        return 3.14159 * self.radius ** 2

    def perimeter(self) -> float:
        return 2 * 3.14159 * self.radius


if __name__ == "__main__":
    shapes = [Rectangle(3, 4), Circle(2)]
    for shape in shapes:
        print(shape.describe())

    try:
        Shape()
    except TypeError as e:
        print(f"cannot instantiate: {e}")
