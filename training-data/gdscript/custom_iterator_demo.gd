extends Node

class Countdown:
	var start: int
	var stop: int

	func _init(from: int, to: int = 0):
		start = from
		stop = to

	func _iter_init(iter) -> bool:
		iter[0] = start
		return iter[0] > stop

	func _iter_next(iter) -> bool:
		iter[0] -= 1
		return iter[0] > stop

	func _iter_get(iter):
		return iter[0]

func _ready():
	for value in Countdown.new(5):
		print(value)
