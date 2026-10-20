class Positive:
    """Data descriptor that rejects non-positive values."""

    def __set_name__(self, owner, name):
        self.private = "_" + name

    def __get__(self, obj, objtype=None):
        if obj is None:
            return self
        return getattr(obj, self.private)

    def __set__(self, obj, value):
        if value <= 0:
            raise ValueError("value must be positive")
        setattr(obj, self.private, value)


class Item:
    price = Positive()
    quantity = Positive()

    def __init__(self, price, quantity):
        self.price = price
        self.quantity = quantity


if __name__ == "__main__":
    item = Item(2.5, 4)
    print(item.price * item.quantity)
    try:
        item.quantity = 0
    except ValueError as exc:
        print("error:", exc)
