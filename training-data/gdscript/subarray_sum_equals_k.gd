# Count contiguous subarrays whose sum equals k (prefix sums + Dictionary).
extends Node

func count_subarrays(nums: Array[int], k: int) -> int:
	var seen := {0: 1}
	var total := 0
	var count := 0
	for x in nums:
		total += x
		count += seen.get(total - k, 0)
		seen[total] = seen.get(total, 0) + 1
	return count

func _ready() -> void:
	print(count_subarrays([1, 1, 1], 2))
