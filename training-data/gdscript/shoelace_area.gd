extends Node

func area(pts: PackedVector2Array) -> float:
	var s := 0.0
	for i in pts.size():
		var p := pts[i]
		var q := pts[(i + 1) % pts.size()]
		s += p.x * q.y - q.x * p.y
	return absf(s) / 2.0

func _ready() -> void:
	print(area(PackedVector2Array([Vector2(0, 0), Vector2(4, 0), Vector2(4, 3), Vector2(0, 3)])))
