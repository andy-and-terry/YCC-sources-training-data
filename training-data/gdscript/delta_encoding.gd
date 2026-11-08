extends Node

func encode(xs: Array) -> Array:
	var d := [xs[0]]
	for i in range(1, xs.size()):
		d.append(xs[i] - xs[i - 1])
	return d

func decode(ds: Array) -> Array:
	var out := []
	var acc := 0
	for d in ds:
		acc += d
		out.append(acc)
	return out

func _ready() -> void:
	var d := encode([10, 12, 15, 15, 20])
	print(d)
	print(decode(d))
