extends SceneTree

# Reverse-and-add until a palindrome; count the steps.
func reverse_digits(n: int) -> int:
	var r := 0
	while n > 0:
		r = r * 10 + n % 10
		n /= 10
	return r

func steps(start: int) -> int:
	var n := start
	for count in range(50):
		if count > 0 and n == reverse_digits(n):
			return count
		n += reverse_digits(n)
	return -1

func _init() -> void:
	var out := []
	for s in [56, 57, 59, 79, 89]:
		out.append(str(steps(s)))
	print(" ".join(out))
	quit()
