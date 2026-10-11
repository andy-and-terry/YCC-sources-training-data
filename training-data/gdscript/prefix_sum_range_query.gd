extends Node

func build(a: Array) -> Array:
	var p = [0]
	for v in a:
		p.append(p[-1] + v)
	return p

func range_sum(p: Array, l: int, r: int) -> int:
	return p[r + 1] - p[l]

func _ready():
	var a = [3, 1, 4, 1, 5, 9, 2, 6]
	var p = build(a)
	print(p)
	print(range_sum(p, 2, 5))
	print(range_sum(p, 0, 7))
