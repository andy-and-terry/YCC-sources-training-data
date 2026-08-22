extends Node

func fibonacci(n: int) -> Array:
	var result = []
	var a = 0
	var b = 1
	for i in range(n):
		result.append(a)
		var temp = a + b
		a = b
		b = temp
	return result

func _ready():
	print(fibonacci(11))
