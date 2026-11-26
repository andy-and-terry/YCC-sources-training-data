extends SceneTree
# Primorials up to 1e6, including 1; expect 8.
# Run with: godot --headless -s <file>

func is_prime(n: int) -> bool:
	if n < 2:
		return false
	var d := 2
	while d * d <= n:
		if n % d == 0:
			return false
		d += 1
	return true

func _init() -> void:
	var values := [1]
	var acc := 1
	var p := 2
	while true:
		if is_prime(p):
			acc *= p
			if acc > 1000000:
				break
			values.append(acc)
		p += 1
	print(values.size(), " ", values)
	quit()
