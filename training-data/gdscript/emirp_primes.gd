extends SceneTree

func is_prime(n: int) -> bool:
	if n < 2: return false
	var i := 2
	while i * i <= n:
		if n % i == 0: return false
		i += 1
	return true

func rev(n: int) -> int:
	return int(String.num_int64(n).reverse())

func _init() -> void:
	var out := []
	for p in range(2, 100):
		if is_prime(p) and rev(p) != p and is_prime(rev(p)):
			out.append(p)
	print(out)
	quit()
