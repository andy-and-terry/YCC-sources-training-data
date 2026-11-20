extends Node
# Lattice paths with a DP row.
func lattice(n: int) -> int:
	var row := []
	row.resize(n + 1)
	row.fill(1)
	for k in n:
		for j in range(1, n + 1):
			row[j] += row[j - 1]
	return row[n]

func _ready():
	print(lattice(3))
