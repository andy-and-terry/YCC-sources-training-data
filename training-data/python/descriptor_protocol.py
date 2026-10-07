"""The descriptor protocol (__get__/__set__) is what powers
@property, methods and slots -- here used directly to build a
reusable, validated attribute."""


class PositiveNumber:
    def __set_name__(self, owner, name):
        self.name = f"_{name}"

    def __get__(self, instance, owner=None):
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

    def __init__(self, price: float, quantity: int):
        self.price = price
        self.quantity = quantity

    def total(self) -> float:
        return self.price * self.quantity


if __name__ == "__main__":
    p = Product(9.99, 3)
    print(p.total())

    try:
        p.quantity = -1
    except ValueError as e:
        print(e)
