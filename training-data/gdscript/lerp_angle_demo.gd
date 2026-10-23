extends SceneTree

# lerp_angle takes the shortest path around the circle,
# unlike lerp which goes the long way across the wrap point.

func _init() -> void:
	var from_a := deg_to_rad(350.0)
	var to_a := deg_to_rad(10.0)

	for t in [0.0, 0.25, 0.5, 0.75, 1.0]:
		var plain := rad_to_deg(lerp(from_a, to_a, t))
		var wrapped := fposmod(rad_to_deg(lerp_angle(from_a, to_a, t)), 360.0)
		print("t=%.2f lerp=%7.2f lerp_angle=%7.2f" % [t, plain, wrapped])

	# angle_difference gives the signed shortest delta
	print("diff: ", snappedf(rad_to_deg(angle_difference(from_a, to_a)), 0.01))
	quit()
