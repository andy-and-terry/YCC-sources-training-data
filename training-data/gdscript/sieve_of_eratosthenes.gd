extends Node

func sieve(limit: int) -> Array:
	var is_composite = []
	is_composite.resize(limit + 1)
	is_composite.fill(false)
	var i = 2
	while i * i <= limit:
		if not is_composite[i]:
			var j = i * i
			while j <= limit:
				is_composite[j] = true
				j += i
		i += 1
	var primes = []
	for n in range(2, limit + 1):
		if not is_composite[n]:
			primes.append(n)
	return primes

func _ready():
	print(sieve(50))
