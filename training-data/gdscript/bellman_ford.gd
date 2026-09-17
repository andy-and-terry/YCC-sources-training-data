extends Node

const INF = 1000000000

func bellman_ford(num_nodes: int, edges: Array, source: int) -> Array:
	var dist = []
	dist.resize(num_nodes)
	dist.fill(INF)
	dist[source] = 0
	for i in range(num_nodes - 1):
		for edge in edges:
			var u = edge[0]
			var v = edge[1]
			var w = edge[2]
			if dist[u] != INF and dist[u] + w < dist[v]:
				dist[v] = dist[u] + w
	for edge in edges:
		var u = edge[0]
		var v = edge[1]
		var w = edge[2]
		if dist[u] != INF and dist[u] + w < dist[v]:
			push_error("graph contains a negative-weight cycle")
			return []
	return dist

func _ready():
	var edges = [[0, 1, 4], [0, 2, 5], [1, 2, -3], [2, 3, 4], [3, 1, -6]]
	print(bellman_ford(4, edges, 0))
