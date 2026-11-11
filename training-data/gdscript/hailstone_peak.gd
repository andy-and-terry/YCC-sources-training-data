# Highest value reached by the Collatz (hailstone) sequence from n.
extends Node

func peak(n: int) -> int:
	var best := n
	while n != 1:
		n = n / 2 if n % 2 == 0 else 3 * n + 1
		best = maxi(best, n)
	return best

func _ready() -> void:
	print(peak(27))
