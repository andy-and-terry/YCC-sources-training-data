extends Node

func _ready() -> void:
	var xs := [1, 2, 3, 4]
	var sq := xs.map(func(x): return x * x)
	var ev := sq.filter(func(x): return x % 2 == 0)
	print(sq, ev)
