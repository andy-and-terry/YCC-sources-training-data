extends Node

func is_powerful(value: int) -> bool:
	var n := value
	var p := 2
	while p * p <= n:
		if n % p == 0:
			if n % (p * p) != 0:
				return false
			while n % p == 0:
				n /= p
		p += 1
	return n == 1

func _ready() -> void:
	var found := []
	for n in range(1, 101):
		if is_powerful(n):
			found.append(n)
	print(found)
