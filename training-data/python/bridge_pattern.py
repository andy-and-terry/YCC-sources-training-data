from abc import ABC, abstractmethod


class Renderer(ABC):
    """Implementation hierarchy, kept separate from the abstraction."""

    @abstractmethod
    def render_circle(self, radius: float) -> str: ...

    @abstractmethod
    def render_square(self, side: float) -> str: ...


class VectorRenderer(Renderer):
    def render_circle(self, radius: float) -> str:
        return f"drawing circle of radius {radius} as vector paths"

    def render_square(self, side: float) -> str:
        return f"drawing square of side {side} as vector paths"


class RasterRenderer(Renderer):
    def render_circle(self, radius: float) -> str:
        return f"rasterizing circle of radius {radius} to a pixel grid"

    def render_square(self, side: float) -> str:
        return f"rasterizing square of side {side} to a pixel grid"


class Shape(ABC):
    def __init__(self, renderer: Renderer):
        self.renderer = renderer

    @abstractmethod
    def draw(self) -> str: ...


class Circle(Shape):
    def __init__(self, renderer: Renderer, radius: float):
        super().__init__(renderer)
        self.radius = radius

    def draw(self) -> str:
        return self.renderer.render_circle(self.radius)


class Square(Shape):
    def __init__(self, renderer: Renderer, side: float):
        super().__init__(renderer)
        self.side = side

    def draw(self) -> str:
        return self.renderer.render_square(self.side)


if __name__ == "__main__":
    shapes = [Circle(VectorRenderer(), 3), Square(RasterRenderer(), 4)]
    for shape in shapes:
        print(shape.draw())
