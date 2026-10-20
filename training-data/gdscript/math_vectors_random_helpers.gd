extends Node

func _ready() -> void:
	var a := Vector2(3, 4)
	var b := Vector2(1, 0)
	print(a.length(), " ", a.dot(b), " ", a.angle_to(b), " ", a.lerp(b, 0.5), " ", a.reflect(Vector2.UP), " ", a.rotated(PI / 2).snapped(Vector2(0.01, 0.01)))
	var v3 := Vector3(1, 2, 3)
	print(v3.cross(Vector3.UP), " ", v3.normalized().length(), " ", v3 * 2, " ", v3.abs(), " ", v3.max_axis_index())
	print(clamp(15, 0, 10), " ", clampf(1.5, 0.0, 1.0), " ", lerpf(0.0, 10.0, 0.25), " ", remap(5, 0, 10, 0, 100), " ", wrapi(12, 0, 10), " ", snappedf(3.14159, 0.01))
	print(deg_to_rad(180), " ", rad_to_deg(PI), " ", sqrt(144.0), " ", pow(2, 10), " ", absf(-2.5), " ", signi(-5), " ", floori(-2.5), " ", ceili(2.1), " ", roundi(2.5))
	print(min(3, 9), max(3, 9), " ", fposmod(-1.0, 3.0), " ", posmod(-1, 3), " ", is_equal_approx(0.1 + 0.2, 0.3), " ", is_zero_approx(0.0))
	seed(42)
	var r := randi_range(1, 6)
	print(r >= 1 and r <= 6, " ", randf() < 1.0, " ", [1, 2, 3].pick_random() in [1, 2, 3])
	var rng := RandomNumberGenerator.new()
	rng.seed = 7
	print(rng.randi_range(0, 0), " ", typeof(rng.randf()) == TYPE_FLOAT)
	print(Color(1, 0.5, 0).to_html(false), " ", Color.html("#ff8000").g)
