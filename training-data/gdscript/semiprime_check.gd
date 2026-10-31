extends Node

func prime_factor_count(value: int) -> int:
	var n := value
	var count := 0
	var p := 2
	while p * p <= n:
		while n % p == 0:
			n /= p
			count += 1
		p += 1
	if n > 1:
		count += 1
	return count

func _ready() -> void:
	var found := []
	for n in range(2, 30):
		if prime_factor_count(n) == 2:
			found.append(n)
	print(found)
