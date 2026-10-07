import copy
from typing import Dict


class Shape:
    def __init__(self, kind: str, **attrs):
        self.kind = kind
        self.attrs = attrs

    def clone(self) -> "Shape":
        return copy.deepcopy(self)

    def __repr__(self) -> str:
        return f"Shape({self.kind}, {self.attrs})"


class ShapeRegistry:
    """Holds prototype instances; clients clone rather than construct fresh."""

    def __init__(self):
        self._prototypes: Dict[str, Shape] = {}

    def register(self, key: str, prototype: Shape) -> None:
        self._prototypes[key] = prototype

    def create(self, key: str, **overrides) -> Shape:
        clone = self._prototypes[key].clone()
        clone.attrs.update(overrides)
        return clone


if __name__ == "__main__":
    registry = ShapeRegistry()
    registry.register("circle", Shape("circle", radius=1, color="black"))

    a = registry.create("circle")
    b = registry.create("circle", radius=5, color="red")
    print(a, b)
    print(a is b, a.attrs is b.attrs)
