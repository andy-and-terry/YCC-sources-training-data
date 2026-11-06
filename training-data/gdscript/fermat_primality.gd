# Fermat primality test; Carmichael number 561 fools it.
extends Node

func powmod(b: int, e: int, m: int) -> int:
	var result := 1
	b %= m
	while e > 0:
		if e & 1 == 1:
			result = result * b % m
		b = b * b % m
		e >>= 1
	return result

func probably_prime(n: int) -> bool:
	return n > 2 and powmod(2, n - 1, n) == 1

func _ready() -> void:
	for n in [97, 91, 561]:
		print(n, " ", probably_prime(n))
