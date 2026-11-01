extends Node

class Item:
	var name: String
	var price: int
	func _init(n: String, p: int):
		name = n
		price = p

static func total(items: Array) -> int:
	var t := 0
	for i in items:
		t += i.price
	return t

func _ready():
	print(total([Item.new("a", 5), Item.new("b", 7)]))
