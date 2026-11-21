extends SceneTree

# Cantor pairing function and its inverse.
func pair(x: int, y: int) -> int:
	return (x + y) * (x + y + 1) / 2 + y

func unpair(z: int) -> Vector2i:
	var w := (int(sqrt(8.0 * z + 1.0)) - 1) / 2
	var y := z - w * (w + 1) / 2
	return Vector2i(w - y, y)

func _init() -> void:
	print(pair(3, 4))
	var p := unpair(32)
	print(p.x, " ", p.y)
	quit()
