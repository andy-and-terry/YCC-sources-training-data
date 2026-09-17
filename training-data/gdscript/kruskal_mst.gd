extends Node

class KruskalUnionFind:
	var parent = []

	func _init(n: int):
		for i in range(n):
			parent.append(i)

	func find(x: int) -> int:
		if parent[x] == x:
			return x
		parent[x] = find(parent[x])
		return parent[x]

	func union(x: int, y: int) -> bool:
		var root_x = find(x)
		var root_y = find(y)
		if root_x == root_y:
			return false
		parent[root_x] = root_y
		return true

func kruskal(num_nodes: int, edges: Array) -> Array:
	var sorted_edges = edges.duplicate()
	sorted_edges.sort_custom(func(a, b): return a[2] < b[2])
	var uf = KruskalUnionFind.new(num_nodes)
	var mst = []
	for edge in sorted_edges:
		if uf.union(edge[0], edge[1]):
			mst.append(edge)
	return mst

func _ready():
	var edges = [[0, 1, 1], [0, 2, 3], [1, 2, 4], [1, 3, 2], [2, 3, 5]]
	print(kruskal(4, edges))
