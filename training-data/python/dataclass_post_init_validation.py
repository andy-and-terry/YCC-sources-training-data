from dataclasses import dataclass, field


@dataclass
class Rectangle:
    width: float
    height: float
    area: float = field(init=False)

    def __post_init__(self):
        if self.width <= 0 or self.height <= 0:
            raise ValueError("width and height must be positive")
        self.area = self.width * self.height


if __name__ == "__main__":
    rect = Rectangle(3, 4)
    print(rect)

    try:
        Rectangle(-1, 4)
    except ValueError as e:
        print(e)
