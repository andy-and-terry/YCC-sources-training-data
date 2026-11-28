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

func reverse_number(n: int) -> int:
	var r := ""
	var s := str(n)
	for i in range(s.length() - 1, -1, -1):
		r += s[i]
	return int(r)

func _ready() -> void:
	var result := []
	for p in range(2, 200):
		var r := reverse_number(p)
		if r != p and is_prime(p) and is_prime(r):
			result.append(p)
	print(result)  # [13, 17, 31, 37, 71, 73, 79, 97, 107, 113, 149, 157, 167, 179, 199]
