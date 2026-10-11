extends Node

func transpose(m: Array) -> Array:
	var rows = m.size()
	var cols = m[0].size()
	var out = []
	for c in cols:
		var row = []
		for r in rows:
			row.append(m[r][c])
		out.append(row)
	return out

func rotate_cw(m: Array) -> Array:
	var t = transpose(m)
	for row in t:
		row.reverse()
	return t

func _ready():
	var m = [[1, 2, 3], [4, 5, 6]]
	print(transpose(m))
	print(rotate_cw(m))
