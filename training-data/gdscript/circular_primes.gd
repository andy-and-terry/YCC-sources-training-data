extends SceneTree
# Circular primes below 100; expect 13.
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

func circular(n: int) -> bool:
	var s := str(n)
	for i in range(s.length()):
		if not is_prime(int(s.substr(i) + s.substr(0, i))):
			return false
	return true

func _init() -> void:
	var c := 0
	for n in range(2, 100):
		if circular(n):
			c += 1
	print(c)
	quit()
