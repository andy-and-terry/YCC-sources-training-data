extends Node

@export var speeds: Array[float] = [1.0, 2.5]

func _ready():
	var total := 0.0
	for s in speeds:
		total += s
	print(total)
