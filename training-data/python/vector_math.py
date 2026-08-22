import math
from dataclasses import dataclass


@dataclass
class Vector3:
    x: float
    y: float
    z: float

    def __add__(self, other):
        return Vector3(self.x + other.x, self.y + other.y, self.z + other.z)

    def __sub__(self, other):
        return Vector3(self.x - other.x, self.y - other.y, self.z - other.z)

    def dot(self, other) -> float:
        return self.x * other.x + self.y * other.y + self.z * other.z

    def cross(self, other) -> "Vector3":
        return Vector3(
            self.y * other.z - self.z * other.y,
            self.z * other.x - self.x * other.z,
            self.x * other.y - self.y * other.x,
        )

    def length(self) -> float:
        return math.sqrt(self.dot(self))

    def normalized(self) -> "Vector3":
        length = self.length()
        return Vector3(self.x / length, self.y / length, self.z / length)


if __name__ == "__main__":
    a = Vector3(1, 0, 0)
    b = Vector3(0, 1, 0)
    print(a.cross(b), a.dot(b), (a + b).length())
