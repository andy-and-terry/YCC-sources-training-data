extends Node

func _ready():
	var a := Vector2(3, 4)
	var b := Vector2(1, 0)
	print(a.length())
	print(a.normalized())
	print(a.dot(b))
	print(a.distance_to(b))
	print(a + b, " ", a - b, " ", a * 2)
	print(a.angle_to(b))
	print(b.rotated(PI / 2).snapped(Vector2(0.01, 0.01)))
	print(a.lerp(b, 0.5))
	print(a.project(b))
	print(a.reflect(Vector2.UP))
	print(a.clamp(Vector2.ZERO, Vector2(2, 2)))
	print(Vector2.from_angle(0))
	print(a.is_equal_approx(Vector2(3.0, 4.0)))
