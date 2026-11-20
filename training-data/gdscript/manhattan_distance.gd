extends Node
# Manhattan distance for grid movement (Vector2i).
func manhattan(a: Vector2i, b: Vector2i) -> int:
	var d := (a - b).abs()
	return d.x + d.y

func _ready():
	print(manhattan(Vector2i(1, 2), Vector2i(4, 6)))
