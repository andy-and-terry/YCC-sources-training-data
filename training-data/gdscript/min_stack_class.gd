extends Node

class MinStack:
	var _vals: Array[int] = []
	var _mins: Array[int] = []

	func push(x: int) -> void:
		_mins.append(min(x, _mins.back()) if not _mins.is_empty() else x)
		_vals.append(x)

	func pop() -> int:
		_mins.pop_back()
		return _vals.pop_back()

	func minimum() -> int:
		return _mins.back()

func _ready() -> void:
	var s := MinStack.new()
	for v in [5, 3, 7, 2]:
		s.push(v)
	print(s.minimum())
	s.pop()
	print(s.minimum())
