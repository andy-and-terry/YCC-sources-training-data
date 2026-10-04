extends Node

func _ready():
	var root_children := []
	for i in range(3):
		var n := Node.new()
		n.name = "Child%d" % i
		add_child(n)
		root_children.append(n)

	root_children[0].add_to_group("enemies")
	root_children[2].add_to_group("enemies")
	root_children[1].add_to_group("friends")
	root_children[2].add_to_group("friends")

	print(get_child_count())
	print(get_children().map(func(n): return n.name))
	print(get_tree().get_nodes_in_group("enemies").size())
	print(root_children[2].is_in_group("friends"))
	print(root_children[2].get_groups())

	var nested := Node.new()
	nested.name = "Nested"
	root_children[0].add_child(nested)
	print(nested.get_path_to(self))
	print(get_node("Child0/Nested").name)
	print(find_child("Nested", true, false) == nested)
	print(has_node("Child1"), has_node("Nope"))
	print(nested.get_parent().name)

	root_children[2].remove_from_group("enemies")
	print(get_tree().get_nodes_in_group("enemies").size())

	for child in get_children():
		child.queue_free()
