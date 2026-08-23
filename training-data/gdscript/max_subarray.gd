extends Node

func kadane(items: Array) -> int:
	var best = items[0]
	var current = items[0]
	for i in range(1, items.size()):
		current = max(items[i], current + items[i])
		best = max(best, current)
	return best

func _ready():
	print(kadane([-2, 1, -3, 4, -1, 2, 1, -5, 4]))
