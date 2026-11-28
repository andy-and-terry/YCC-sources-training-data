extends SceneTree

func is_prime(n: int) -> bool:
	if n < 2: return false
	var i := 2
	while i * i <= n:
		if n % i == 0: return false
		i += 1
	return true

func _init() -> void:
	var out := []
	var y := 1
	while out.size() < 8:
		var p := 3 * y * y + 3 * y + 1
		if is_prime(p): out.append(p)
		y += 1
	print(out)
	quit()
