extends SceneTree

func _init() -> void:
	var n := 7
	var d := []
	for i in n + 1:
		d.append([])
		for j in n + 1:
			d[i].append(1)
	for i in range(1, n + 1):
		for j in range(1, n + 1):
			d[i][j] = d[i - 1][j] + d[i][j - 1] + d[i - 1][j - 1]
	var diag := []
	for i in n + 1: diag.append(d[i][i])
	print(diag)
	quit()
