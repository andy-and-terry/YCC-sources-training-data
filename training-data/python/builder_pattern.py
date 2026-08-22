class Pizza:
    def __init__(self):
        self.toppings = []
        self.size = "medium"

    def __repr__(self):
        return f"Pizza(size={self.size}, toppings={self.toppings})"


class PizzaBuilder:
    def __init__(self):
        self._pizza = Pizza()

    def size(self, size: str) -> "PizzaBuilder":
        self._pizza.size = size
        return self

    def add_topping(self, topping: str) -> "PizzaBuilder":
        self._pizza.toppings.append(topping)
        return self

    def build(self) -> Pizza:
        return self._pizza


if __name__ == "__main__":
    pizza = PizzaBuilder().size("large").add_topping("cheese").add_topping("olives").build()
    print(pizza)
