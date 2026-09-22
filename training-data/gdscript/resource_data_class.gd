extends Node

class ItemData extends Resource:
	@export var item_name: String = ""
	@export var value: int = 0
	@export var weight: float = 0.0

	func _init(n: String = "", v: int = 0, w: float = 0.0):
		item_name = n
		value = v
		weight = w

	func value_per_weight() -> float:
		if weight == 0.0:
			return 0.0
		return value / weight

func _ready():
	var items = [
		ItemData.new("Sword", 100, 5.0),
		ItemData.new("Gem", 500, 0.5),
		ItemData.new("Shield", 80, 8.0)
	]
	for item in items:
		print(item.item_name, ": ", item.value_per_weight())
