extends RefCounted

class Item:
	var name: String
	var qty: int
	func _init(n: String, q: int) -> void:
		name = n
		qty = q

static func total(items: Array) -> int:
	var t := 0
	for i in items:
		t += i.qty
	return t
