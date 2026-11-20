extends Node
# Shoelace polygon area with Vector2 points.
func area(pts: Array[Vector2]) -> float:
	var s := 0.0
	for i in pts.size():
		var q := pts[(i + 1) % pts.size()]
		s += pts[i].x * q.y - q.x * pts[i].y
	return abs(s) / 2.0

func _ready():
	print(area([Vector2(0, 0), Vector2(4, 0), Vector2(4, 3), Vector2(0, 3)]))
