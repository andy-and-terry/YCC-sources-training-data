from typing import Dict, Tuple


class TreeType:
    """The shared (intrinsic) state: expensive data reused across many
    objects. Only one TreeType exists per distinct (name, color, texture)."""

    def __init__(self, name: str, color: str, texture: str):
        self.name = name
        self.color = color
        self.texture = texture

    def draw(self, x: int, y: int) -> None:
        print(f"drawing {self.color} {self.name} ({self.texture}) at ({x}, {y})")


class TreeFactory:
    _flyweights: Dict[Tuple[str, str, str], TreeType] = {}

    @classmethod
    def get_tree_type(cls, name: str, color: str, texture: str) -> TreeType:
        key = (name, color, texture)
        if key not in cls._flyweights:
            print(f"creating new flyweight for {key}")
            cls._flyweights[key] = TreeType(name, color, texture)
        return cls._flyweights[key]

    @classmethod
    def flyweight_count(cls) -> int:
        return len(cls._flyweights)


class Tree:
    """The extrinsic state (position) lives on the individual tree, not
    on the shared flyweight."""

    def __init__(self, x: int, y: int, tree_type: TreeType):
        self.x = x
        self.y = y
        self.tree_type = tree_type

    def draw(self) -> None:
        self.tree_type.draw(self.x, self.y)


class Forest:
    def __init__(self):
        self.trees = []

    def plant(self, x: int, y: int, name: str, color: str, texture: str) -> None:
        tree_type = TreeFactory.get_tree_type(name, color, texture)
        self.trees.append(Tree(x, y, tree_type))

    def draw(self) -> None:
        for tree in self.trees:
            tree.draw()


if __name__ == "__main__":
    forest = Forest()
    forest.plant(1, 2, "Oak", "green", "rough")
    forest.plant(5, 6, "Oak", "green", "rough")
    forest.plant(9, 1, "Pine", "dark green", "needled")
    forest.plant(3, 8, "Oak", "green", "rough")

    forest.draw()
    print("trees planted:", len(forest.trees))
    print("flyweight objects created:", TreeFactory.flyweight_count())
