"""Prototype pattern: create new objects by cloning an existing
"prototype" instance instead of constructing from scratch. Useful when
construction is expensive or when the exact class of an object should
be decided at runtime by copying a template."""

import copy
from typing import Dict


class Sheep:
    def __init__(self, name: str, weight: float, tags: list):
        self.name = name
        self.weight = weight
        self.tags = tags  # mutable list -- worth watching in the clone

    def clone(self) -> "Sheep":
        return copy.deepcopy(self)

    def __repr__(self) -> str:
        return f"Sheep(name={self.name!r}, weight={self.weight}, tags={self.tags})"


class PrototypeRegistry:
    """Keeps a catalog of pre-configured prototypes, cloned on demand."""

    def __init__(self):
        self._prototypes: Dict[str, Sheep] = {}

    def register(self, key: str, prototype: Sheep) -> None:
        self._prototypes[key] = prototype

    def create(self, key: str) -> Sheep:
        return self._prototypes[key].clone()


if __name__ == "__main__":
    dolly = Sheep("Dolly", weight=45.0, tags=["cloned", "sheep"])

    registry = PrototypeRegistry()
    registry.register("sheep", dolly)

    clone_a = registry.create("sheep")
    clone_b = registry.create("sheep")
    clone_a.name = "Dolly II"
    clone_a.tags.append("first-clone")

    print(dolly)
    print(clone_a)
    print(clone_b)
    assert clone_a is not dolly
    assert clone_b.tags == ["cloned", "sheep"]  # deep copy: unaffected by clone_a
