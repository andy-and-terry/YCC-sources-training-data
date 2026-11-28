extends Node

func reverse_byte(value: int) -> int:
	var result := 0
	for i in 8:
		result = (result << 1) | (value & 1)
		value >>= 1
	return result

func _ready() -> void:
	for v in [1, 6, 13, 128]:
		print(v, " ", reverse_byte(v))  # 128 96 176 1
