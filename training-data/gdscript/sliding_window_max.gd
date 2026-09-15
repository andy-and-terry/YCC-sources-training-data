extends Node

func sliding_window_max(nums: Array, k: int) -> Array:
	var result = []
	var deque = []
	for i in range(nums.size()):
		while deque.size() > 0 and deque[0] <= i - k:
			deque.pop_front()
		while deque.size() > 0 and nums[deque[deque.size() - 1]] <= nums[i]:
			deque.pop_back()
		deque.append(i)
		if i >= k - 1:
			result.append(nums[deque[0]])
	return result

func _ready():
	var nums = [1, 3, -1, -3, 5, 3, 6, 7]
	print(sliding_window_max(nums, 3))
