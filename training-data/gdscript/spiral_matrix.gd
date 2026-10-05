extends Node

func spiral(m: Array) -> Array:
	var out: Array = []
	var top := 0
	var bottom := m.size() - 1
	var left := 0
	var right: int = m[0].size() - 1
	while top <= bottom and left <= right:
		for j in range(left, right + 1):
			out.append(m[top][j])
		top += 1
		for i in range(top, bottom + 1):
			out.append(m[i][right])
		right -= 1
		if top <= bottom:
			for j in range(right, left - 1, -1):
				out.append(m[bottom][j])
			bottom -= 1
		if left <= right:
			for i in range(bottom, top - 1, -1):
				out.append(m[i][left])
			left += 1
	return out

func _ready():
	print(spiral([[1, 2, 3], [4, 5, 6], [7, 8, 9]]))
