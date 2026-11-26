extends SceneTree
# Deficient numbers below 100; expect 76.
# Run with: godot --headless -s <file>

func proper_sum(n: int) -> int:
	var t := 0
	for d in range(1, n):
		if n % d == 0:
			t += d
	return t

func _init() -> void:
	var c := 0
	for n in range(1, 100):
		if proper_sum(n) < n:
			c += 1
	print(c)
	quit()
