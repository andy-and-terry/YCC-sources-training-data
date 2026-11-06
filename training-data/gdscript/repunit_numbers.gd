# Repunits: numbers made only of the digit 1.
extends Node

func _ready() -> void:
	var r := 0
	var out: Array[int] = []
	for i in 5:
		r = r * 10 + 1
		out.append(r)
	print(out)
