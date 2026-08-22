from abc import ABC, abstractmethod


class Shape(ABC):
    @abstractmethod
    def area(self) -> float: ...


class Circle(Shape):
    def __init__(self, radius):
        self.radius = radius

    def area(self) -> float:
        return 3.14159 * self.radius ** 2


class Square(Shape):
    def __init__(self, side):
        self.side = side

    def area(self) -> float:
        return self.side ** 2


def shape_factory(kind: str, **kwargs) -> Shape:
    shapes = {"circle": Circle, "square": Square}
    if kind not in shapes:
        raise ValueError(f"unknown shape: {kind}")
    return shapes[kind](**kwargs)


if __name__ == "__main__":
    print(shape_factory("circle", radius=2).area())
    print(shape_factory("square", side=3).area())
