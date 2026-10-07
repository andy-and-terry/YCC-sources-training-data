extends Node

func minimax(node, maximizing: bool) -> int:
	if typeof(node) == TYPE_INT:
		return node

	var scores = []
	for child in node:
		scores.append(minimax(child, not maximizing))

	if maximizing:
		return scores.max()
	return scores.min()

func _ready():
	var game_tree = [
		[[3, 5], [6, 9]],
		[[1, 2], [0, -1]]
	]
	print(minimax(game_tree, true))
