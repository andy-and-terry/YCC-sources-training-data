extends Node

func is_toeplitz(m: Array) -> bool:
	for i in range(1, m.size()):
		for j in range(1, m[i].size()):
			if m[i][j] != m[i - 1][j - 1]:
				return false
	return true

func _ready() -> void:
	print(is_toeplitz([[1, 2, 3], [4, 1, 2], [5, 4, 1]]))
	print(is_toeplitz([[1, 2], [2, 2]]))
