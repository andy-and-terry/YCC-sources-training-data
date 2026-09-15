from typing import Protocol, runtime_checkable


@runtime_checkable
class SupportsArea(Protocol):
    def area(self) -> float:
        ...


class Circle:
    def __init__(self, radius: float):
        self.radius = radius

    def area(self) -> float:
        return 3.14159 * self.radius ** 2


class Square:
    def __init__(self, side: float):
        self.side = side

    def area(self) -> float:
        return self.side ** 2


class NotAShape:
    pass


def total_area(shapes: list) -> float:
    return sum(shape.area() for shape in shapes)


if __name__ == "__main__":
    shapes = [Circle(2), Square(3)]
    print(round(total_area(shapes), 2))
    print(isinstance(Circle(1), SupportsArea))
    print(isinstance(NotAShape(), SupportsArea))
