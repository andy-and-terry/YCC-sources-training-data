extends Node

class TreeNode:
	var value
	var left = null
	var right = null

	func _init(v):
		value = v

func insert(node, value):
	if node == null:
		return TreeNode.new(value)
	if value < node.value:
		node.left = insert(node.left, value)
	elif value > node.value:
		node.right = insert(node.right, value)
	return node

func inorder(node, result: Array):
	if node == null:
		return
	inorder(node.left, result)
	result.append(node.value)
	inorder(node.right, result)

func _ready():
	var root = null
	for v in [5, 3, 8, 1, 4, 7, 9]:
		root = insert(root, v)
	var result = []
	inorder(root, result)
	print(result)
