extends Node

func _ready():
	var root = Node.new()
	root.name = "Root"
	for i in range(3):
		var child = Node.new()
		child.name = "Child%d" % i
		root.add_child(child)
	var leaf = Node.new()
	leaf.name = "Leaf"
	root.get_node("Child1").add_child(leaf)
	print(root.get_child_count())
	print(root.get_node("Child1/Leaf").name)
	print(root.has_node("Child2"))
	for c in root.get_children():
		print(c.name)
	root.get_child(0).queue_free()
	root.free()
