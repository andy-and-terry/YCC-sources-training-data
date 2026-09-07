extends Node

class SegmentTree:
	var tree = []
	var n: int

	func _init(values: Array):
		n = values.size()
		tree.resize(4 * n)
		for i in range(4 * n):
			tree[i] = 0
		if n > 0:
			build(values, 1, 0, n - 1)

	func build(values: Array, node: int, start: int, end: int):
		if start == end:
			tree[node] = values[start]
			return
		var mid = (start + end) / 2
		build(values, node * 2, start, mid)
		build(values, node * 2 + 1, mid + 1, end)
		tree[node] = tree[node * 2] + tree[node * 2 + 1]

	func query(node: int, start: int, end: int, l: int, r: int) -> int:
		if r < start or end < l:
			return 0
		if l <= start and end <= r:
			return tree[node]
		var mid = (start + end) / 2
		return query(node * 2, start, mid, l, r) + query(node * 2 + 1, mid + 1, end, l, r)

	func range_sum(l: int, r: int) -> int:
		return query(1, 0, n - 1, l, r)

	func update(node: int, start: int, end: int, idx: int, value: int):
		if start == end:
			tree[node] = value
			return
		var mid = (start + end) / 2
		if idx <= mid:
			update(node * 2, start, mid, idx, value)
		else:
			update(node * 2 + 1, mid + 1, end, idx, value)
		tree[node] = tree[node * 2] + tree[node * 2 + 1]

	func set_value(idx: int, value: int):
		update(1, 0, n - 1, idx, value)

func _ready():
	var seg = SegmentTree.new([1, 3, 5, 7, 9, 11])
	print(seg.range_sum(1, 3))
	seg.set_value(1, 10)
	print(seg.range_sum(1, 3))
