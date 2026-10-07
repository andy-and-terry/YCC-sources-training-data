extends Node

func pascal_row(n: int) -> Array[int]:
	var row: Array[int] = [1]
	for i in range(n):
		var next: Array[int] = [1]
		for j in range(row.size() - 1):
			next.append(row[j] + row[j + 1])
		next.append(1)
		row = next
	return row

func _ready():
	for i in range(7):
		print(pascal_row(i))
