extends Node

class RangeSum:
	var prefix: Array[int] = [0]

	func _init(values: Array[int]) -> void:
		for v in values:
			prefix.append(prefix[-1] + v)

	func query(lo: int, hi: int) -> int:
		return prefix[hi] - prefix[lo]

func _ready() -> void:
	var rs := RangeSum.new([3, 1, 4, 1, 5, 9, 2, 6])
	print(rs.query(2, 5))
