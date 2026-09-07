extends Node

class PriorityQueue:
	var heap = []

	func push(value, priority: int):
		heap.append([priority, value])
		var i = heap.size() - 1
		while i > 0:
			var parent = (i - 1) / 2
			if heap[parent][0] <= heap[i][0]:
				break
			var tmp = heap[parent]
			heap[parent] = heap[i]
			heap[i] = tmp
			i = parent

	func pop():
		if heap.is_empty():
			return null
		var top = heap[0]
		var last = heap.pop_back()
		if not heap.is_empty():
			heap[0] = last
			var i = 0
			while true:
				var left = i * 2 + 1
				var right = i * 2 + 2
				var smallest = i
				if left < heap.size() and heap[left][0] < heap[smallest][0]:
					smallest = left
				if right < heap.size() and heap[right][0] < heap[smallest][0]:
					smallest = right
				if smallest == i:
					break
				var tmp = heap[i]
				heap[i] = heap[smallest]
				heap[smallest] = tmp
				i = smallest
		return top[1]

	func is_empty() -> bool:
		return heap.is_empty()

func _ready():
	var pq = PriorityQueue.new()
	pq.push("low", 5)
	pq.push("high", 1)
	pq.push("medium", 3)
	while not pq.is_empty():
		print(pq.pop())
