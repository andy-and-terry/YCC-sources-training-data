extends Node

class FenwickTree:
	var tree = []
	var n: int

	func _init(size: int):
		n = size
		tree.resize(n + 1)
		tree.fill(0)

	func update(i: int, delta: int) -> void:
		var idx = i
		while idx <= n:
			tree[idx] += delta
			idx += idx & (-idx)

	func prefix_sum(i: int) -> int:
		var idx = i
		var total = 0
		while idx > 0:
			total += tree[idx]
			idx -= idx & (-idx)
		return total

	func range_sum(l: int, r: int) -> int:
		return prefix_sum(r) - prefix_sum(l - 1)

func _ready():
	var values = [3, 2, -1, 6, 5, 4, -3, 3, 7, 2]
	var fenwick = FenwickTree.new(values.size())
	for i in range(values.size()):
		fenwick.update(i + 1, values[i])
	print(fenwick.range_sum(1, 5))
	fenwick.update(3, 4)
	print(fenwick.range_sum(1, 5))
