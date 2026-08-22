extends Node

func is_prime(n: int) -> bool:
	if n < 2:
		return false
	var i = 2
	while i * i <= n:
		if n % i == 0:
			return false
		i += 1
	return true

func _ready():
	var primes = []
	for n in range(2, 21):
		if is_prime(n):
			primes.append(n)
	print(primes)
