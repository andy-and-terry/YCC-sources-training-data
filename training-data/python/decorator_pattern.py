"""The GoF Decorator pattern: wrap objects to add behavior dynamically.

Not to be confused with Python's `@decorator` syntax (see decorators.py) --
this is the structural design pattern of the same name, implemented with
plain object composition.
"""


class Coffee:
    def cost(self):
        return 2.0

    def description(self):
        return "coffee"


class CoffeeDecorator(Coffee):
    def __init__(self, coffee):
        self._coffee = coffee

    def cost(self):
        return self._coffee.cost()

    def description(self):
        return self._coffee.description()


class MilkDecorator(CoffeeDecorator):
    def cost(self):
        return self._coffee.cost() + 0.5

    def description(self):
        return self._coffee.description() + ", milk"


class SugarDecorator(CoffeeDecorator):
    def cost(self):
        return self._coffee.cost() + 0.25

    def description(self):
        return self._coffee.description() + ", sugar"


if __name__ == "__main__":
    order = SugarDecorator(MilkDecorator(Coffee()))
    print(f"{order.description()}: ${order.cost():.2f}")
