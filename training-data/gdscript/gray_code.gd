extends Node

func gray_code(n: int) -> Array:
	var out: Array = []
	for i in range(1 << n):
		out.append(i ^ (i >> 1))
	return out

func to_binary(x: int, width: int) -> String:
	var s := ""
	for i in range(width - 1, -1, -1):
		s += str((x >> i) & 1)
	return s

func _ready():
	for g in gray_code(3):
		print(to_binary(g, 3))
