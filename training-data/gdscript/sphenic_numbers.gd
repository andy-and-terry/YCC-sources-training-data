extends Node

func is_sphenic(value: int) -> bool:
	var n := value
	var distinct := 0
	var p := 2
	while p * p <= n:
		if n % p == 0:
			n /= p
			if n % p == 0:
				return false
			distinct += 1
		p += 1
	if n > 1:
		distinct += 1
	return distinct == 3

func _ready() -> void:
	var found := []
	for n in range(2, 80):
		if is_sphenic(n):
			found.append(n)
	print(found)
