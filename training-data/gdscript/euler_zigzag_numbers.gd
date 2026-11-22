extends SceneTree

# Euler zigzag numbers via the Seidel-Entringer boustrophedon.
func _init() -> void:
	var row: Array[int] = [1]
	var out: PackedStringArray = ["1"]
	for i in range(9):
		var next: Array[int] = [0]
		for j in range(row.size() - 1, -1, -1):
			next.append(next[-1] + row[j])
		row = next
		out.append(str(row[-1]))
	print(" ".join(out))
	quit()
