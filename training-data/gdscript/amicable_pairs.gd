extends SceneTree

# Amicable pairs below 1500 via sums of proper divisors.
func s(n: int) -> int:
	var t := 0
	for d in range(1, n):
		if n % d == 0:
			t += d
	return t

func _init() -> void:
	for a in range(2, 1500):
		var b := s(a)
		if b > a and s(b) == a:
			print(a, " ", b)
	quit()
