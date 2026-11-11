# Narayana's cows N(n)=N(n-1)+N(n-3)
extends Node

func _ready() -> void:
	var v := [1, 1, 1]
	for i in range(3, 10):
		v.append(v[i - 1] + v[i - 3])
	print(v)
