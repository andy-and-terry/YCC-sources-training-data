extends Node

var move_count = 0

func hanoi(n: int, source: String, auxiliary: String, target: String) -> void:
	if n == 0:
		return
	hanoi(n - 1, source, target, auxiliary)
	move_count += 1
	print("move disk ", n, " from ", source, " to ", target)
	hanoi(n - 1, auxiliary, source, target)

func _ready():
	hanoi(3, "A", "B", "C")
	print("total moves: ", move_count)
