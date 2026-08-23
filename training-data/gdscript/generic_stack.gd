extends Node

class Stack:
	var items = []

	func push(item):
		items.append(item)

	func pop():
		if items.is_empty():
			return null
		return items.pop_back()

	func is_empty() -> bool:
		return items.is_empty()

func _ready():
	var s = Stack.new()
	s.push(1)
	s.push(2)
	s.push(3)
	print(s.pop())
	print(s.pop())
