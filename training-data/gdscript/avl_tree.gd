extends Node

class AvlNode:
	var value: int
	var left = null
	var right = null
	var height: int = 1

	func _init(v: int):
		value = v

func node_height(node) -> int:
	if node == null:
		return 0
	return node.height

func balance_factor(node) -> int:
	if node == null:
		return 0
	return node_height(node.left) - node_height(node.right)

func update_height(node):
	node.height = 1 + max(node_height(node.left), node_height(node.right))

func rotate_right(y):
	var x = y.left
	var t2 = x.right
	x.right = y
	y.left = t2
	update_height(y)
	update_height(x)
	return x

func rotate_left(x):
	var y = x.right
	var t2 = y.left
	y.left = x
	x.right = t2
	update_height(x)
	update_height(y)
	return y

func insert(node, value: int):
	if node == null:
		return AvlNode.new(value)
	if value < node.value:
		node.left = insert(node.left, value)
	elif value > node.value:
		node.right = insert(node.right, value)
	else:
		return node

	update_height(node)
	var balance = balance_factor(node)

	if balance > 1 and value < node.left.value:
		return rotate_right(node)
	if balance < -1 and value > node.right.value:
		return rotate_left(node)
	if balance > 1 and value > node.left.value:
		node.left = rotate_left(node.left)
		return rotate_right(node)
	if balance < -1 and value < node.right.value:
		node.right = rotate_right(node.right)
		return rotate_left(node)

	return node

func inorder(node, result: Array):
	if node == null:
		return
	inorder(node.left, result)
	result.append(node.value)
	inorder(node.right, result)

func _ready():
	var root = null
	for v in [10, 20, 30, 40, 50, 25]:
		root = insert(root, v)
	var result = []
	inorder(root, result)
	print(result)
	print("root=", root.value, " height=", root.height)
