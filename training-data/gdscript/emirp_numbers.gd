# Emirps: primes whose digit reversal is a different prime.
extends Node

func is_prime(n: int) -> bool:
	if n < 2:
		return false
	var i := 2
	while i * i <= n:
		if n % i == 0:
			return false
		i += 1
	return true

func reverse_digits(n: int) -> int:
	return str(n).reverse().to_int()

func _ready() -> void:
	var emirps: Array[int] = []
	for n in range(2, 100):
		var r := reverse_digits(n)
		if r != n and is_prime(n) and is_prime(r):
			emirps.append(n)
	print(emirps)
