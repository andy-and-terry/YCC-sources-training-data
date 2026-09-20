import copy


class Sheep:
    def __init__(self, name, weight, tags=None):
        self.name = name
        self.weight = weight
        self.tags = tags if tags is not None else []

    def clone(self):
        # deepcopy so the clone's mutable `tags` list is independent of
        # the original's, unlike a shallow copy.copy() would give us.
        return copy.deepcopy(self)

    def __repr__(self):
        return f"Sheep(name={self.name!r}, weight={self.weight}, tags={self.tags})"


if __name__ == "__main__":
    dolly_original = Sheep("Dolly", 45.0, tags=["clone-source"])

    dolly_clone = dolly_original.clone()
    dolly_clone.name = "Dolly II"
    dolly_clone.tags.append("clone")

    print("original:", dolly_original)
    print("clone:   ", dolly_clone)
    print("tags share no storage:", dolly_original.tags is not dolly_clone.tags)
