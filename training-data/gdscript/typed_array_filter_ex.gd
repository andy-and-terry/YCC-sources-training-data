extends Node

func _ready():
	var nums: Array[int] = [1, 2, 3, 4, 5, 6]
	var evens = nums.filter(func(n): return n % 2 == 0)
	var doubled = nums.map(func(n): return n * 2)
	var total = nums.reduce(func(a, b): return a + b, 0)
	print(evens, doubled, total)
