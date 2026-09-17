extends Node

func bfs(graph: Dictionary, start: String) -> Array:
	var visited = {start: true}
	var order = []
	var queue = [start]
	while not queue.is_empty():
		var node = queue.pop_front()
		order.append(node)
		for neighbor in graph.get(node, []):
			if not visited.has(neighbor):
				visited[neighbor] = true
				queue.append(neighbor)
	return order

func _ready():
	var graph = {
		"a": ["b", "c"],
		"b": ["d"],
		"c": ["d"],
		"d": []
	}
	print(bfs(graph, "a"))
