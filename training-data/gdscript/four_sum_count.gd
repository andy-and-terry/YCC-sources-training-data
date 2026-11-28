func four_sum_count(a: Array, b: Array, c: Array, d: Array) -> int:
	var sums := {}
	for x in a:
		for y in b:
			sums[x + y] = sums.get(x + y, 0) + 1
	var count := 0
	for x in c:
		for y in d:
			count += sums.get(-(x + y), 0)
	return count

func _ready() -> void:
	print(four_sum_count([1, 2], [-2, -1], [-1, 2], [0, 2]))  # 2
