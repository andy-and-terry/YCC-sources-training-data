"""Bridge pattern: decouple an abstraction from its implementation so
the two can vary independently. Here a "Shape" abstraction is bridged
to a "Renderer" implementation -- new shapes and new renderers can be
added on either side without touching the other."""

from abc import ABC, abstractmethod


class Renderer(ABC):
    @abstractmethod
    def render_circle(self, radius: float) -> str:
        ...

    @abstractmethod
    def render_square(self, side: float) -> str:
        ...


class VectorRenderer(Renderer):
    def render_circle(self, radius: float) -> str:
        return f"drawing a circle of radius {radius} as a math outline"

    def render_square(self, side: float) -> str:
        return f"drawing a square of side {side} as a math outline"


class RasterRenderer(Renderer):
    def render_circle(self, radius: float) -> str:
        return f"drawing a circle of radius {radius} as pixels"

    def render_square(self, side: float) -> str:
        return f"drawing a square of side {side} as pixels"


class Shape(ABC):
    def __init__(self, renderer: Renderer):
        self._renderer = renderer

    @abstractmethod
    def draw(self) -> str:
        ...


class Circle(Shape):
    def __init__(self, renderer: Renderer, radius: float):
        super().__init__(renderer)
        self._radius = radius

    def draw(self) -> str:
        return self._renderer.render_circle(self._radius)


class Square(Shape):
    def __init__(self, renderer: Renderer, side: float):
        super().__init__(renderer)
        self._side = side

    def draw(self) -> str:
        return self._renderer.render_square(self._side)


if __name__ == "__main__":
    shapes = [
        Circle(VectorRenderer(), 5),
        Square(RasterRenderer(), 3),
    ]
    for shape in shapes:
        print(shape.draw())
