extends SceneTree

func is_prime(n: int) -> bool:
	if n < 2:
		return false
	var i := 2
	while i * i <= n:
		if n % i == 0:
			return false
		i += 1
	return true

func _init() -> void:
	var found: Array[int] = []
	var p := 2
	while found.size() < 10:
		if is_prime(p) and is_prime(2 * p + 1):
			found.append(p)
		p += 1
	print(found) # [2, 3, 5, 11, 23, 29, 41, 53, 83, 89]
	quit()
