class_name InventoryItem
extends Resource

@export var item_name: String = ""
@export var weight: float = 1.0
@export var stackable: bool = true

static func create(n: String, w: float) -> InventoryItem:
	var item := InventoryItem.new()
	item.item_name = n
	item.weight = w
	return item

func describe() -> String:
	return "%s (%.1f kg)%s" % [item_name, weight, " stackable" if stackable else ""]

func _to_string() -> String:
	return "InventoryItem<%s>" % item_name

static func total_weight(items: Array[InventoryItem]) -> float:
	var sum := 0.0
	for i in items:
		sum += i.weight
	return sum
