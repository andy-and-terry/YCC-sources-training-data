extends Node

func _ready():
	var nums: Array[int] = [1, 2, 3, 4, 5, 6]
	var evens := nums.filter(func(n): return n % 2 == 0)
	var squares := nums.map(func(n): return n * n)
	var total := nums.reduce(func(acc, n): return acc + n, 0)
	print(evens, " ", squares, " ", total)
	print(nums.any(func(n): return n > 5), " ", nums.all(func(n): return n > 1))
	print(nums.count(3), " ", nums.find(4), " ", nums.max(), " ", nums.min())
