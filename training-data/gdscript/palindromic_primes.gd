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

func is_palindrome(n: int) -> bool:
	var s := str(n)
	for i in s.length() / 2:
		if s[i] != s[s.length() - 1 - i]:
			return false
	return true

func _ready() -> void:
	var result := []
	for n in range(2, 200):
		if is_palindrome(n) and is_prime(n):
			result.append(n)
	print(result)  # [2, 3, 5, 7, 11, 101, 131, 151, 181, 191]
