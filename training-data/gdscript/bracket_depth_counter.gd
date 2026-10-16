extends Node

func max_depth(s: String) -> int:
	var depth = 0
	var best = 0
	for ch in s:
		if ch == "(":
			depth += 1
			best = max(best, depth)
		elif ch == ")":
			depth -= 1
			if depth < 0:
				return -1
	return best if depth == 0 else -1

func _ready():
	print(max_depth("(1+(2*3)+((8)/4))+1"))
	print(max_depth("())("))
	print(max_depth("((("))
