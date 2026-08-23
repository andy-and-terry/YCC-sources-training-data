extends Node

class ListNode:
	var value
	var next = null

	func _init(v):
		value = v

func from_array(arr: Array) -> ListNode:
	var head = null
	for i in range(arr.size() - 1, -1, -1):
		var node = ListNode.new(arr[i])
		node.next = head
		head = node
	return head

func to_array(head: ListNode) -> Array:
	var result = []
	var node = head
	while node != null:
		result.append(node.value)
		node = node.next
	return result

func reverse(head: ListNode) -> ListNode:
	var prev = null
	var current = head
	while current != null:
		var next_node = current.next
		current.next = prev
		prev = current
		current = next_node
	return prev

func _ready():
	var head = from_array([1, 2, 3, 4, 5])
	var reversed_head = reverse(head)
	print(to_array(reversed_head))
