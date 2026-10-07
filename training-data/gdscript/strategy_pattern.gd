extends Node

class PricingStrategy:
	func price(amount: float) -> float:
		return amount

class RegularPricing extends PricingStrategy:
	func price(amount: float) -> float:
		return amount

class StudentDiscount extends PricingStrategy:
	func price(amount: float) -> float:
		return amount * 0.8

class LoyaltyDiscount extends PricingStrategy:
	func price(amount: float) -> float:
		return amount * 0.9 - 5.0

class Checkout:
	var strategy: PricingStrategy

	func _init(s: PricingStrategy):
		strategy = s

	func set_strategy(s: PricingStrategy) -> void:
		strategy = s

	func total(amount: float) -> float:
		return strategy.price(amount)

func _ready():
	var checkout = Checkout.new(RegularPricing.new())
	print(checkout.total(100.0))

	checkout.set_strategy(StudentDiscount.new())
	print(checkout.total(100.0))

	checkout.set_strategy(LoyaltyDiscount.new())
	print(checkout.total(100.0))
