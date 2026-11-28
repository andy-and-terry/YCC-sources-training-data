func plus_one(digits: Array) -> Array:
	var d := digits.duplicate()
	for i in range(d.size() - 1, -1, -1):
		if d[i] < 9:
			d[i] += 1
			return d
		d[i] = 0
	d.push_front(1)
	return d

func _ready() -> void:
	print(plus_one([1, 2, 9]))  # [1, 3, 0]
	print(plus_one([9, 9]))     # [1, 0, 0]
