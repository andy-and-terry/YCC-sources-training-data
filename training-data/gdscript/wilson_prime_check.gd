extends Node
# Wilson's theorem primality test.
func wilson(n: int) -> bool:
	if n < 2: return false
	var f := 1
	for i in range(2, n): f = f * i % n
	return f == n - 1

func _ready():
	for n in range(2, 20):
		if wilson(n): print(n)
