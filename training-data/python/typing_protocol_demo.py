from typing import Protocol


class Drawable(Protocol):
    def draw(self) -> str: ...


class Circle:
    def draw(self) -> str:
        return "circle"


def render(d: Drawable) -> str:
    return d.draw()


print(render(Circle()))
