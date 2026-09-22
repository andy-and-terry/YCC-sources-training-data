extends Node

class DListNode:
	var value
	var prev: DListNode = null
	var next: DListNode = null

	func _init(v):
		value = v

class DoublyLinkedList:
	var head: DListNode = null
	var tail: DListNode = null

	func push_back(v) -> void:
		var node = DListNode.new(v)
		if tail == null:
			head = node
			tail = node
		else:
			node.prev = tail
			tail.next = node
			tail = node

	func push_front(v) -> void:
		var node = DListNode.new(v)
		if head == null:
			head = node
			tail = node
		else:
			node.next = head
			head.prev = node
			head = node

	func remove(v) -> bool:
		var cur = head
		while cur != null:
			if cur.value == v:
				if cur.prev != null:
					cur.prev.next = cur.next
				else:
					head = cur.next
				if cur.next != null:
					cur.next.prev = cur.prev
				else:
					tail = cur.prev
				return true
			cur = cur.next
		return false

	func to_array() -> Array:
		var result = []
		var cur = head
		while cur != null:
			result.append(cur.value)
			cur = cur.next
		return result

func _ready():
	var list = DoublyLinkedList.new()
	list.push_back(1)
	list.push_back(2)
	list.push_front(0)
	list.push_back(3)
	print(list.to_array())
	list.remove(2)
	print(list.to_array())
