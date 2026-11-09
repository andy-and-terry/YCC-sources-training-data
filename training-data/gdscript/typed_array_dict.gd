extends Node

func _ready() -> void:
	var nums: Array[int] = [3, 1, 2]
	nums.sort()
	print(nums)
	var d := {"a": 1, "b": 2}
	for k in d:
		print(k, "=", d[k])
