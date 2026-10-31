extends Node

func cube_from_odds(n: int) -> int:
	var start := n * n - n + 1
	var total := 0
	for i in n:
		total += start + 2 * i
	return total

func _ready() -> void:
	for n in range(1, 6):
		print(n, " ", cube_from_odds(n), " ", cube_from_odds(n) == n * n * n)
