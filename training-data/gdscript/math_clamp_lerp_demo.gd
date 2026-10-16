extends Node

func _ready():
	print(clamp(15, 0, 10), clampf(-1.5, 0.0, 1.0), clampi(7, 0, 5))
	print(lerp(0.0, 10.0, 0.25))
	print(inverse_lerp(0.0, 10.0, 7.5))
	print(remap(5.0, 0.0, 10.0, 100.0, 200.0))
	print(move_toward(0.0, 10.0, 3.0))
	print(snappedf(3.14159, 0.01))
	print(wrapi(12, 0, 10), wrapf(-0.5, 0.0, 1.0))
	print(smoothstep(0.0, 1.0, 0.5))
	print(sign(-4), absf(-2.5), floori(2.7), ceili(2.1), roundi(2.5))
	print(is_equal_approx(0.1 + 0.2, 0.3))
	print(deg_to_rad(180.0), rad_to_deg(PI / 2))
