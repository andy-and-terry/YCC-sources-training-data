extends Node

func pascal(n: int) -> Array:
	var rows: Array = []
	for i in range(n):
		var row: Array = []
		for j in range(i + 1):
			if j == 0 or j == i:
				row.append(1)
			else:
				row.append(rows[i - 1][j - 1] + rows[i - 1][j])
		rows.append(row)
	return rows

func _ready():
	for row in pascal(6):
		print(" ".join(row.map(func(x): return str(x))))
