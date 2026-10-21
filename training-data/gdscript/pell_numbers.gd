extends SceneTree

# P(n) = 2*P(n-1) + P(n-2), with P(0) = 0 and P(1) = 1
func _init() -> void:
	var a := 0
	var b := 1
	for i in range(15):
		print("P(%d) = %d" % [i, a])
		var next := 2 * b + a
		a = b
		b = next
	quit()
