extends Node

func stern(count: int) -> Array:
	var seq := [0, 1]
	for i in range(2, count):
		var h := i / 2
		if i % 2 == 0:
			seq.append(seq[h])
		else:
			seq.append(seq[h] + seq[h + 1])
	return seq.slice(0, count)

func _ready() -> void:
	print(stern(15))  # [0, 1, 1, 2, 1, 3, 2, 3, 1, 4, 3, 5, 2, 5, 3]
