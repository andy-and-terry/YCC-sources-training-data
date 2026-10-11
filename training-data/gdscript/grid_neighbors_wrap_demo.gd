extends Node

const W := 5
const H := 4

func neighbors4(p: Vector2i) -> Array:
	var out = []
	for d in [Vector2i(1, 0), Vector2i(-1, 0), Vector2i(0, 1), Vector2i(0, -1)]:
		var n = p + d
		if n.x >= 0 and n.x < W and n.y >= 0 and n.y < H:
			out.append(n)
	return out

func neighbors_wrap(p: Vector2i) -> Array:
	var out = []
	for d in [Vector2i(1, 0), Vector2i(-1, 0), Vector2i(0, 1), Vector2i(0, -1)]:
		out.append(Vector2i(posmod(p.x + d.x, W), posmod(p.y + d.y, H)))
	return out

func _ready():
	print(neighbors4(Vector2i(0, 0)))
	print(neighbors_wrap(Vector2i(0, 0)))
