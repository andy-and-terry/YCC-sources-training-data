extends Node

func _ready():
	var a := Vector2(3, 4)
	var b := Vector2(1, 0)

	print(a.length(), " ", a.normalized())
	print(a + b, " ", a - b, " ", a * 2.0)
	print(a.dot(b), " ", a.cross(b))
	print(a.distance_to(b))
	print(snappedf(a.angle(), 0.001))
	print(snappedf(rad_to_deg(a.angle_to(b)), 0.01))

	print(b.rotated(PI / 2).snapped(Vector2(0.01, 0.01)))
	print(a.lerp(Vector2.ZERO, 0.5))
	print(a.limit_length(2.0))
	print(Vector2(5, -2).abs(), " ", Vector2(5.7, -2.2).floor())

	var wall_normal := Vector2.UP
	var velocity := Vector2(2, -3)
	print(velocity.bounce(wall_normal))
	print(velocity.reflect(wall_normal))
	print(velocity.project(Vector2.RIGHT))
	print(Vector2.from_angle(0).is_equal_approx(Vector2.RIGHT))
