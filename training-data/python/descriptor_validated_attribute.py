class Positive:
    def __set_name__(self, owner, name):
        self.name = "_" + name

    def __get__(self, obj, objtype=None):
        return getattr(obj, self.name)

    def __set__(self, obj, value):
        if value <= 0:
            raise ValueError("must be positive")
        setattr(obj, self.name, value)


class Item:
    price = Positive()

    def __init__(self, price):
        self.price = price


print(Item(5).price)
try:
    Item(-1)
except ValueError as e:
    print("error:", e)
