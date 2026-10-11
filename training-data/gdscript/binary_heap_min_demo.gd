extends Node

var heap: Array = []

func push(v):
	heap.append(v)
	var i = heap.size() - 1
	while i > 0 and heap[(i - 1) / 2] > heap[i]:
		var p = (i - 1) / 2
		var t = heap[p]
		heap[p] = heap[i]
		heap[i] = t
		i = p

func pop():
	var top = heap[0]
	var last = heap.pop_back()
	if heap.size() > 0:
		heap[0] = last
		var i = 0
		while true:
			var l = 2 * i + 1
			var r = l + 1
			var m = i
			if l < heap.size() and heap[l] < heap[m]: m = l
			if r < heap.size() and heap[r] < heap[m]: m = r
			if m == i: break
			var t = heap[m]
			heap[m] = heap[i]
			heap[i] = t
			i = m
	return top

func _ready():
	for v in [5, 3, 8, 1, 9, 2]:
		push(v)
	var out = []
	while heap.size() > 0:
		out.append(pop())
	print(out)
