extends Node

# Checks whether an undirected graph (given as an adjacency list) is
# bipartite by attempting a two-coloring via BFS.
func is_bipartite(adj: Array) -> bool:
	var n = adj.size()
	var color = []
	for _i in range(n):
		color.append(-1)

	for start in range(n):
		if color[start] != -1:
			continue
		color[start] = 0
		var queue = [start]
		while not queue.is_empty():
			var u = queue.pop_front()
			for v in adj[u]:
				if color[v] == -1:
					color[v] = 1 - color[u]
					queue.append(v)
				elif color[v] == color[u]:
					return false
	return true

func _ready():
	var bipartite_graph = [[1, 3], [0, 2], [1, 3], [0, 2]]
	var odd_cycle_graph = [[1, 2], [0, 2], [0, 1]]
	print(is_bipartite(bipartite_graph))
	print(is_bipartite(odd_cycle_graph))
