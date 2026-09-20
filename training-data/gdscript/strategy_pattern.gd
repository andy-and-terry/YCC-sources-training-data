extends Node

# GoF Strategy pattern: swap the pricing algorithm a Cart uses at runtime
# without changing the Cart itself.
class DiscountStrategy:
	func apply(total: float) -> float:
		return total

class NoDiscount extends DiscountStrategy:
	func apply(total: float) -> float:
		return total

class PercentOffDiscount extends DiscountStrategy:
	var percent: float

	func _init(p: float):
		percent = p

	func apply(total: float) -> float:
		return total * (1.0 - percent / 100.0)

class FlatOffDiscount extends DiscountStrategy:
	var amount: float

	func _init(a: float):
		amount = a

	func apply(total: float) -> float:
		return max(0.0, total - amount)

class Cart:
	var strategy: DiscountStrategy
	var subtotal: float = 0.0

	func _init(s: DiscountStrategy):
		strategy = s

	func add_item(price: float) -> void:
		subtotal += price

	func set_strategy(s: DiscountStrategy) -> void:
		strategy = s

	func checkout_total() -> float:
		return strategy.apply(subtotal)

func _ready():
	var cart = Cart.new(NoDiscount.new())
	cart.add_item(20.0)
	cart.add_item(30.0)
	print(cart.checkout_total())

	cart.set_strategy(PercentOffDiscount.new(10.0))
	print(cart.checkout_total())

	cart.set_strategy(FlatOffDiscount.new(15.0))
	print(cart.checkout_total())
