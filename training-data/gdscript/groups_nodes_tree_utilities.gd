extends Node

func _ready() -> void:
	for i in 3:
		var n := Node.new()
		n.name = "Enemy%d" % i
		n.add_to_group("enemies")
		add_child(n)
	var boss := Node.new()
	boss.name = "Boss"
	boss.add_to_group("enemies")
	boss.add_to_group("bosses")
	add_child(boss)
	print(get_child_count(), " ", get_tree().get_nodes_in_group("enemies").size(), " ", boss.is_in_group("bosses"))
	print(get_node("Boss").name, " ", $Enemy1.name, " ", has_node("Enemy9"), " ", find_child("Enemy2", false) != null)
	for e in get_tree().get_nodes_in_group("enemies"):
		if e != boss:
			e.queue_free()
	await get_tree().process_frame
	print(get_child_count(), " ", get_children().map(func(c): return c.name))
	print(get_path(), " ", is_inside_tree(), " ", get_parent() != null)
