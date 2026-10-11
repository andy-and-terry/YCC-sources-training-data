extends Node

const MAX_STACK := 10
var slots: Array = []

func add_item(id: String, qty: int) -> int:
	for s in slots:
		if s.id == id and s.qty < MAX_STACK:
			var room = MAX_STACK - s.qty
			var put = min(room, qty)
			s.qty += put
			qty -= put
			if qty == 0:
				return 0
	while qty > 0:
		var put = min(MAX_STACK, qty)
		slots.append({"id": id, "qty": put})
		qty -= put
	return qty

func _ready():
	add_item("potion", 7)
	add_item("potion", 8)
	add_item("sword", 1)
	print(slots)
