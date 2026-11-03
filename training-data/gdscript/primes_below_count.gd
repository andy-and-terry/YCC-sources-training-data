extends Node

func count_primes_below(n: int) -> int:
	if n < 3:
		return 0
	var composite := PackedByteArray()
	composite.resize(n)
	var count := 0
	for i in range(2, n):
		if composite[i] == 1:
			continue
		count += 1
		for j in range(i * i, n, i):
			composite[j] = 1
	return count

func _ready() -> void:
	print(count_primes_below(100))
