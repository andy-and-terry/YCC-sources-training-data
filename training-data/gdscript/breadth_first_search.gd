extends Node

func bfs(graph: Dictionary, start: int) -> Array:
	var visited = {start: true}
	var queue = [start]
	var order = []
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
		0: [1, 2],
		1: [0, 3],
		2: [0, 3],
		3: [1, 2, 4],
		4: [3]
	}
	print(bfs(graph, 0))
