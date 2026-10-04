extends Node

func _ready():
	print(lerp(0.0, 10.0, 0.25), " ", lerpf(5.0, 15.0, 0.5))
	print(clamp(15, 0, 10), " ", clampf(-0.5, 0.0, 1.0))
	print(snappedf(3.14159, 0.01), " ", roundi(2.5), " ", floori(-1.5))
	print(wrapi(7, 0, 5), " ", fposmod(-1.0, 3.0), " ", sign(-4))
	print(deg_to_rad(180.0), " ", rad_to_deg(PI / 2))
	print(remap(5.0, 0.0, 10.0, 100.0, 200.0))
	print(move_toward(0.0, 10.0, 3.0), " ", is_equal_approx(0.1 + 0.2, 0.3))
	var v := Vector2(3, 4)
	print(v.length(), " ", v.normalized(), " ", v.dot(Vector2.RIGHT))
