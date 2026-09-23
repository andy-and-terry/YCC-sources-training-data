extends Node

class Beverage:
	func cost() -> float:
		return 0.0

	func description() -> String:
		return "Beverage"

class Coffee extends Beverage:
	func cost() -> float:
		return 2.0

	func description() -> String:
		return "Coffee"

class BeverageDecorator extends Beverage:
	var wrapped: Beverage

	func _init(b: Beverage):
		wrapped = b

class MilkDecorator extends BeverageDecorator:
	func cost() -> float:
		return wrapped.cost() + 0.5

	func description() -> String:
		return wrapped.description() + " + milk"

class SugarDecorator extends BeverageDecorator:
	func cost() -> float:
		return wrapped.cost() + 0.25

	func description() -> String:
		return wrapped.description() + " + sugar"

func _ready():
	var drink: Beverage = Coffee.new()
	drink = MilkDecorator.new(drink)
	drink = SugarDecorator.new(drink)
	print(drink.description(), " = $", drink.cost())
