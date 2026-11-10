extends SceneTree

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
	var r := 0
	while n > 0:
		r = r * 10 + n % 10
		n /= 10
	return r

func _init() -> void:
	var found: Array[int] = []
	var n := 2
	while found.size() < 10:
		var r := reverse_number(n)
		if r != n and is_prime(n) and is_prime(r):
			found.append(n)
		n += 1
	print(found) # [13, 17, 31, 37, 71, 73, 79, 97, 107, 113]
	quit()
