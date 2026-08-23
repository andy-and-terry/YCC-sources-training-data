extends Node

func _ready():
	var numbers = [1, 2, 3, 4, 5]
	var doubled = numbers.map(func(n): return n * 2)
	var evens = numbers.filter(func(n): return n % 2 == 0)
	var total = numbers.reduce(func(acc, n): return acc + n, 0)
	print(doubled)
	print(evens)
	print(total)
