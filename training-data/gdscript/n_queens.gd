extends Node

func is_safe(queens: Array, col: int) -> bool:
	for i in range(queens.size()):
		var dist = queens.size() - i
		if queens[i] == col or abs(queens[i] - col) == dist:
			return false
	return true

func solve(queens: Array, n: int) -> int:
	if queens.size() == n:
		return 1
	var count = 0
	for col in range(n):
		if is_safe(queens, col):
			var new_queens = queens.duplicate()
			new_queens.append(col)
			count += solve(new_queens, n)
	return count

func _ready():
	print(solve([], 6))
