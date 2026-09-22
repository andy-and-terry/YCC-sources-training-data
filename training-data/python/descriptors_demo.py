"""Custom descriptor protocol: a reusable validated-attribute descriptor."""


class PositiveNumber:
    def __set_name__(self, owner, name):
        self.name = f"_{name}"

    def __get__(self, instance, owner):
        if instance is None:
            return self
        return getattr(instance, self.name)

    def __set__(self, instance, value):
        if value <= 0:
            raise ValueError(f"{self.name[1:]} must be positive, got {value}")
        setattr(instance, self.name, value)


class Product:
    price = PositiveNumber()
    quantity = PositiveNumber()

    def __init__(self, name: str, price: float, quantity: int):
        self.name = name
        self.price = price
        self.quantity = quantity

    def total(self) -> float:
        return self.price * self.quantity


if __name__ == "__main__":
    widget = Product("Widget", 9.99, 3)
    print(f"{widget.name}: {widget.total():.2f}")

    try:
        widget.price = -5
    except ValueError as e:
        print(f"rejected: {e}")
