extends Node

func prim(num_nodes: int, edges: Array) -> Array:
	var adj = []
	for i in range(num_nodes):
		adj.append([])
	for edge in edges:
		var u = edge[0]
		var v = edge[1]
		var w = edge[2]
		adj[u].append([v, w])
		adj[v].append([u, w])

	var visited = []
	for i in range(num_nodes):
		visited.append(false)
	visited[0] = true

	var mst = []
	var total_weight = 0

	for _count in range(num_nodes - 1):
		var best_weight = INF
		var best_u = -1
		var best_v = -1
		for u in range(num_nodes):
			if not visited[u]:
				continue
			for pair in adj[u]:
				var v = pair[0]
				var w = pair[1]
				if not visited[v] and w < best_weight:
					best_weight = w
					best_u = u
					best_v = v
		if best_u == -1:
			break
		visited[best_v] = true
		mst.append([best_u, best_v, best_weight])
		total_weight += best_weight

	return [mst, total_weight]

func _ready():
	var edges = [[0, 1, 4], [0, 2, 3], [1, 2, 1], [1, 3, 2], [2, 3, 4], [3, 4, 2]]
	var result = prim(5, edges)
	print(result[0])
	print("total weight: ", result[1])
