extends Node

class MinStack:
	var data: Array = []
	var mins: Array = []

	func push(value: int) -> void:
		data.append(value)
		if mins.is_empty() or value <= mins[-1]:
			mins.append(value)
		else:
			mins.append(mins[-1])

	func pop() -> int:
		mins.pop_back()
		return data.pop_back()

	func top() -> int:
		return data[-1]

	func get_min() -> int:
		return mins[-1]

func _ready():
	var stack := MinStack.new()
	stack.push(5)
	stack.push(2)
	stack.push(8)
	print("min: %d" % stack.get_min())
	stack.pop()
	print("min after pop: %d" % stack.get_min())
	print("top: %d" % stack.top())
