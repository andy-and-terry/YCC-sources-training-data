extends Node

class RangeIterator:
	var current: int
	var stop: int
	var step: int

	func _init(start: int, end: int, s: int = 1) -> void:
		current = start
		stop = end
		step = s

	func has_next() -> bool:
		return current < stop

	func next() -> int:
		var value := current
		current += step
		return value

class Collection:
	var items: Array = []

	func add(item) -> void:
		items.append(item)

	func make_iterator() -> RangeIterator:
		return RangeIterator.new(0, items.size())

func _ready():
	var it := RangeIterator.new(0, 10, 2)
	while it.has_next():
		print(it.next())

	var collection := Collection.new()
	collection.add("a")
	collection.add("b")
	collection.add("c")
	var col_it := collection.make_iterator()
	while col_it.has_next():
		print(collection.items[col_it.next()])
