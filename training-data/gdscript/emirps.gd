extends SceneTree
# Emirps below 200; expect 15.
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
	var c := 0
	for n in range(2, 200):
		var r := int(str(n).reverse())
		if r != n and is_prime(n) and is_prime(r):
			c += 1
	print(c)
	quit()
