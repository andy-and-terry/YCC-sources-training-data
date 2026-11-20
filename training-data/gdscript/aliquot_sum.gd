extends Node
# Aliquot sum classification.
func aliquot(n: int) -> int:
	var s := 0
	for d in range(1, n):
		if n % d == 0: s += d
	return s

func _ready():
	for n in [6, 12, 15, 28]:
		var a := aliquot(n)
		var kind := "perfect" if a == n else ("abundant" if a > n else "deficient")
		print(n, " ", a, " ", kind)
