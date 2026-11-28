extends SceneTree

func area(pts: PackedVector2Array) -> float:
	var s := 0.0
	for i in pts.size():
		var a := pts[i]
		var b := pts[(i + 1) % pts.size()]
		s += a.x * b.y - b.x * a.y
	return absf(s) / 2.0

func _init() -> void:
	print(area(PackedVector2Array([Vector2(0, 0), Vector2(4, 0), Vector2(4, 3), Vector2(0, 3)])))
	quit()
