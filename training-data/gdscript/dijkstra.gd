extends Node

func dijkstra(graph: Dictionary, source: String) -> Dictionary:
	var dist = {}
	for node in graph.keys():
		dist[node] = INF
	dist[source] = 0
	var visited = {}

	for i in range(graph.size()):
		var best_node = null
		var best_dist = INF
		for node in dist.keys():
			if not visited.has(node) and dist[node] < best_dist:
				best_dist = dist[node]
				best_node = node
		if best_node == null:
			break
		visited[best_node] = true
		for edge in graph.get(best_node, []):
			var neighbor = edge[0]
			var weight = edge[1]
			var new_dist = dist[best_node] + weight
			if new_dist < dist[neighbor]:
				dist[neighbor] = new_dist
	return dist

func _ready():
	var graph = {
		"a": [["b", 1], ["c", 4]],
		"b": [["c", 2], ["d", 5]],
		"c": [["d", 1]],
		"d": []
	}
	print(dijkstra(graph, "a"))
