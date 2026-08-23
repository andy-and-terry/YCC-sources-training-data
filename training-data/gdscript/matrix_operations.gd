extends Node

func transpose(matrix: Array) -> Array:
	var rows = matrix.size()
	var cols = matrix[0].size()
	var result = []
	for c in range(cols):
		var row = []
		for r in range(rows):
			row.append(matrix[r][c])
		result.append(row)
	return result

func multiply(a: Array, b: Array) -> Array:
	var bt = transpose(b)
	var result = []
	for row in a:
		var new_row = []
		for col in bt:
			var sum = 0
			for k in range(row.size()):
				sum += row[k] * col[k]
			new_row.append(sum)
		result.append(new_row)
	return result

func _ready():
	var a = [[1, 2], [3, 4]]
	var b = [[5, 6], [7, 8]]
	print(transpose(a))
	print(multiply(a, b))
