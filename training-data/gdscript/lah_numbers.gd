extends SceneTree

func lah(n: int, k: int) -> int:
	var c := 1
	var f := 1
	for i in range(k - 1): c = c * (n - 1 - i) / (i + 1)
	for i in range(k + 1, n + 1): f *= i
	return c * f

func _init() -> void:
	for n in range(1, 6):
		var row := []
		for k in range(1, n + 1): row.append(lah(n, k))
		print(row)
	quit()
