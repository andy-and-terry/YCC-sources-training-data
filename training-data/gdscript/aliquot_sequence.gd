extends Node

# Repeatedly replace n by the sum of its proper divisors until 0
func aliquot(start: int) -> Array:
	var terms := [start]
	var n := start
	while n > 0:
		var total := 0
		for d in range(1, n / 2 + 1):
			if n % d == 0:
				total += d
		n = total
		terms.append(n)
	return terms

func _ready():
	print(" ".join(aliquot(12).map(func(x): return str(x))))
