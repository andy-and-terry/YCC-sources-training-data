extends Node

class FenwickTree:
	var tree: Array
	var size: int

	func _init(n: int):
		size = n
		tree = []
		tree.resize(n + 1)
		tree.fill(0)

	func add(index: int, delta: int):
		var i = index + 1
		while i <= size:
			tree[i] += delta
			i += i & (-i)

	func prefix_sum(index: int) -> int:
		var i = index + 1
		var total = 0
		while i > 0:
			total += tree[i]
			i -= i & (-i)
		return total

	func range_sum(left: int, right: int) -> int:
		if left > 0:
			return prefix_sum(right) - prefix_sum(left - 1)
		return prefix_sum(right)

func _ready():
	var values = [1, 3, 5, 7, 9, 11]
	var ft = FenwickTree.new(values.size())
	for i in range(values.size()):
		ft.add(i, values[i])
	print(ft.range_sum(1, 3))
	ft.add(1, 10)
	print(ft.range_sum(1, 3))
