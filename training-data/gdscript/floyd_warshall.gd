extends Node

const INF = 1000000000

func floyd_warshall(num_nodes: int, edges: Array) -> Array:
	var dist = []
	dist.resize(num_nodes)
	for i in range(num_nodes):
		var row = []
		row.resize(num_nodes)
		row.fill(INF)
		row[i] = 0
		dist[i] = row

	for edge in edges:
		var u = edge[0]
		var v = edge[1]
		var w = edge[2]
		if w < dist[u][v]:
			dist[u][v] = w

	for k in range(num_nodes):
		for i in range(num_nodes):
			if dist[i][k] == INF:
				continue
			for j in range(num_nodes):
				if dist[k][j] == INF:
					continue
				if dist[i][k] + dist[k][j] < dist[i][j]:
					dist[i][j] = dist[i][k] + dist[k][j]

	return dist

func _ready():
	var edges = [[0, 1, 3], [0, 2, 8], [1, 2, 2], [2, 3, 1], [3, 0, 4], [1, 3, 6]]
	var dist = floyd_warshall(4, edges)
	for row in dist:
		print(row)
