extends Node

func rotate_right(a: Array, k: int) -> Array:
	if a.is_empty():
		return a
	k = posmod(k, a.size())
	return a.slice(a.size() - k) + a.slice(0, a.size() - k)

func _ready():
	print(rotate_right([1, 2, 3, 4, 5], 2))
	print(rotate_right([1, 2, 3], 4))
	print(rotate_right([1, 2, 3], -1))
	print(rotate_right([], 3))
