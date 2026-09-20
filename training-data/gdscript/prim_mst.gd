extends Node

# Prim's algorithm for a minimum spanning tree over an adjacency-matrix graph.
# 0 means "no edge" (the graph is assumed connected and weights are positive).
func prim_mst(graph: Array) -> Array:
	var n = graph.size()
	var in_mst = []
	var key = []
	var parent = []
	for i in range(n):
		in_mst.append(false)
		key.append(INF)
		parent.append(-1)
	key[0] = 0

	var edges = []
	for _count in range(n):
		var u = -1
		var best = INF
		for v in range(n):
			if not in_mst[v] and key[v] < best:
				best = key[v]
				u = v
		if u == -1:
			break
		in_mst[u] = true
		if parent[u] != -1:
			edges.append([parent[u], u, graph[parent[u]][u]])
		for v in range(n):
			var weight = graph[u][v]
			if weight > 0 and not in_mst[v] and weight < key[v]:
				key[v] = weight
				parent[v] = u
	return edges

func _ready():
	var graph = [
		[0, 2, 0, 6, 0],
		[2, 0, 3, 8, 5],
		[0, 3, 0, 0, 7],
		[6, 8, 0, 0, 9],
		[0, 5, 7, 9, 0],
	]
	var mst = prim_mst(graph)
	var total = 0
	for edge in mst:
		total += edge[2]
	print(mst)
	print("total weight=", total)
