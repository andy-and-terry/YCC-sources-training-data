extends Node

func _ready():
	var numbers = range(1, 11)
	var evens = numbers.filter(func(n): return n % 2 == 0)
	var squares = evens.map(func(n): return n * n)
	var total = 0
	for n in numbers:
		total += n
	print(squares)
	print(total)
