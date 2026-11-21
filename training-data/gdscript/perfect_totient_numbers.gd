extends SceneTree

# Perfect totient numbers: sum of the iterated totient chain down to 1 equals n.
func gcd_int(a: int, b: int) -> int:
	while b != 0:
		var t := a % b
		a = b
		b = t
	return a

func phi(n: int) -> int:
	var c := 0
	for k in range(1, n + 1):
		if gcd_int(k, n) == 1:
			c += 1
	return c

func is_perfect_totient(n: int) -> bool:
	var total := 0
	var m := n
	while m > 1:
		m = phi(m)
		total += m
	return total == n

func _init() -> void:
	var out: PackedStringArray = []
	for n in range(2, 200):
		if is_perfect_totient(n):
			out.append(str(n))
	print(" ".join(out))
	quit()
