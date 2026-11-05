extends Node

func _ready():
	var nums: Array[int] = [1, 2, 3, 4, 5, 6]
	var evens = nums.filter(func(n): return n % 2 == 0)
	var doubled = evens.map(func(n): return n * 2)
	print(doubled)
