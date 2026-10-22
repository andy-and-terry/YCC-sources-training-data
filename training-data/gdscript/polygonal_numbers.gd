extends Node

# s-gonal number: P(s, n) = ((s - 2) * n^2 - (s - 4) * n) / 2
func polygonal(s: int, n: int) -> int:
	return ((s - 2) * n * n - (s - 4) * n) / 2

func first_ten(s: int) -> Array:
	var result := []
	for n in range(1, 11):
		result.append(polygonal(s, n))
	return result

func _ready():
	print("Triangular: ", first_ten(3))
	print("Pentagonal: ", first_ten(5))
	print("Hexagonal: ", first_ten(6))
