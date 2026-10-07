extends Node

func factorize(n: int) -> Array[int]:
	var factors: Array[int] = []
	var p := 2
	while p * p <= n:
		while n % p == 0:
			factors.append(p)
			n /= p
		p += 1
	if n > 1:
		factors.append(n)
	return factors

func _ready():
	print(factorize(360))
	print(factorize(97))
	print(factorize(600851475143))
