extends SceneTree
# Squarefree numbers up to 100; expect 61.
# Run with: godot --headless -s <file>

func squarefree(n: int) -> bool:
	var d := 2
	while d * d <= n:
		if n % (d * d) == 0:
			return false
		d += 1
	return true

func _init() -> void:
	var c := 0
	for n in range(1, 101):
		if squarefree(n):
			c += 1
	print(c)
	quit()
