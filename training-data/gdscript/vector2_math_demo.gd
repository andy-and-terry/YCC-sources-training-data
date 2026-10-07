extends Node

func _ready():
	var a := Vector2(3, 4)
	var b := Vector2(1, 0)
	print(a.length(), " ", a.normalized())
	print(a + b, " ", a - b, " ", a * 2)
	print(a.dot(b), " ", a.cross(b))
	print(a.distance_to(b))
	print(snappedf(a.angle(), 0.001))
	print(a.lerp(b, 0.5))
	print(b.rotated(PI / 2).snapped(Vector2(0.01, 0.01)))
	print(a.reflect(Vector2.UP))
	print(a.project(b), " ", a.clamp(Vector2.ZERO, Vector2(2, 2)))
