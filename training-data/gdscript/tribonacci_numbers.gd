extends SceneTree

# Tribonacci: T0=0, T1=0, T2=1, T(n) = T(n-1) + T(n-2) + T(n-3)
func tribonacci(count: int) -> Array:
	var t := [0, 0, 1]
	while t.size() < count:
		var n := t.size()
		t.append(t[n - 1] + t[n - 2] + t[n - 3])
	return t.slice(0, count)

func _init() -> void:
	print("Tribonacci: ", tribonacci(15))
	quit()
