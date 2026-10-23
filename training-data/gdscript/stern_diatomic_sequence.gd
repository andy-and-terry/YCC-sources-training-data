extends Node

# Stern's diatomic: s(0) = 0, s(1) = 1, s(2n) = s(n), s(2n+1) = s(n) + s(n+1)
func stern(count: int) -> Array:
	var s := [0, 1]
	for n in range(2, count):
		var h := n / 2
		if n % 2 == 0:
			s.append(s[h])
		else:
			s.append(s[h] + s[h + 1])
	return s

func _ready():
	print(stern(20))
