extends Node

class Queue:
	var items = []

	func enqueue(item):
		items.append(item)

	func dequeue():
		if items.is_empty():
			return null
		return items.pop_front()

func _ready():
	var q = Queue.new()
	q.enqueue(1)
	q.enqueue(2)
	q.enqueue(3)
	print(q.dequeue())
	print(q.dequeue())
