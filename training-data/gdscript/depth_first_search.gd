extends Node

func dfs(graph: Dictionary, start: String) -> Array:
	var visited = {}
	var order = []
	var stack = [start]
	while not stack.is_empty():
		var node = stack.pop_back()
		if visited.has(node):
			continue
		visited[node] = true
		order.append(node)
		var neighbors = graph.get(node, [])
		for i in range(neighbors.size() - 1, -1, -1):
			if not visited.has(neighbors[i]):
				stack.append(neighbors[i])
	return order

func _ready():
	var graph = {
		"a": ["b", "c"],
		"b": ["d"],
		"c": ["d"],
		"d": []
	}
	print(dfs(graph, "a"))
