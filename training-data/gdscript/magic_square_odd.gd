extends Node

func magic_square(n: int) -> Array:
	var sq: Array = []
	for r in n:
		var row: Array = []
		row.resize(n)
		row.fill(0)
		sq.append(row)
	var r := 0
	var c := n / 2
	for k in range(1, n * n + 1):
		sq[r][c] = k
		var nr := (r - 1 + n) % n
		var nc := (c + 1) % n
		if sq[nr][nc] != 0:
			nr = (r + 1) % n
			nc = c
		r = nr
		c = nc
	return sq

func _ready() -> void:
	for row in magic_square(5):
		print(row)
	print("Magic constant: ", 5 * (25 + 1) / 2)
