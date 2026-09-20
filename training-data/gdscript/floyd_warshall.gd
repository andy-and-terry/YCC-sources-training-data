extends Node

# All-pairs shortest paths via Floyd-Warshall. INF (Godot's built-in infinity
# constant) marks "no direct edge" between two distinct vertices.
func floyd_warshall(graph: Array) -> Array:
	var n = graph.size()
	var dist = []
	for i in range(n):
		dist.append(graph[i].duplicate())

	for k in range(n):
		for i in range(n):
			for j in range(n):
				if dist[i][k] + dist[k][j] < dist[i][j]:
					dist[i][j] = dist[i][k] + dist[k][j]
	return dist

func _ready():
	var graph = [
		[0, 5, INF, 10],
		[INF, 0, 3, INF],
		[INF, INF, 0, 1],
		[INF, INF, INF, 0],
	]
	var dist = floyd_warshall(graph)
	for row in dist:
		print(row)
