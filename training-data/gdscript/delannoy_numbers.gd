extends SceneTree

func central_delannoy(n: int) -> int:
	var g := []
	for i in range(n + 1):
		var row := []
		for j in range(n + 1):
			if i == 0 or j == 0:
				row.append(1)
			else:
				row.append(g[i - 1][j] + row[j - 1] + g[i - 1][j - 1])
		g.append(row)
	return g[n][n]

func _init() -> void:
	var out := []
	for n in range(6):
		out.append(central_delannoy(n))
	print(out) # [1, 3, 13, 63, 321, 1683]
	quit()
