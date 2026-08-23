extends Node

class UnionFind:
	var parent = []

	func _init(n: int):
		for i in range(n):
			parent.append(i)

	func find(x: int) -> int:
		if parent[x] == x:
			return x
		return find(parent[x])

	func union(x: int, y: int):
		var root_x = find(x)
		var root_y = find(y)
		if root_x != root_y:
			parent[root_x] = root_y

func _ready():
	var uf = UnionFind.new(5)
	uf.union(0, 1)
	uf.union(1, 2)
	print(uf.find(0) == uf.find(2))
	print(uf.find(0) == uf.find(3))
