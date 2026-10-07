from collections import defaultdict


class Inventory:
    def __init__(self):
        self.stock = defaultdict(int)
        self.prices = {}
        self.reorder_level = {}

    def add_product(self, sku, price, reorder_level=5):
        self.prices[sku] = price
        self.reorder_level[sku] = reorder_level

    def receive(self, sku, qty):
        if sku not in self.prices:
            raise KeyError(f"unknown sku {sku}")
        self.stock[sku] += qty

    def sell(self, sku, qty):
        if self.stock[sku] < qty:
            raise ValueError(f"only {self.stock[sku]} of {sku} left")
        self.stock[sku] -= qty
        return qty * self.prices[sku]

    def low_stock(self):
        return [s for s in self.prices if self.stock[s] <= self.reorder_level[s]]

    def valuation(self):
        return sum(self.stock[s] * p for s, p in self.prices.items())


if __name__ == "__main__":
    inv = Inventory()
    inv.add_product("apple", 0.5, 10)
    inv.add_product("pear", 0.75)
    inv.receive("apple", 40)
    inv.receive("pear", 8)
    revenue = inv.sell("apple", 32) + inv.sell("pear", 2)
    print(f"revenue={revenue:.2f} value={inv.valuation():.2f} low={inv.low_stock()}")
