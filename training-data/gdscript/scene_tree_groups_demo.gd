extends Node

func _ready():
	for i in 3:
		var enemy := Node2D.new()
		enemy.name = "Enemy%d" % i
		enemy.add_to_group("enemies")
		add_child(enemy)

	var boss := Node2D.new()
	boss.name = "Boss"
	boss.add_to_group("enemies")
	boss.add_to_group("bosses")
	add_child(boss)

	print(get_tree().get_nodes_in_group("enemies").size())
	print(boss.is_in_group("bosses"))

	get_tree().call_group("enemies", "set_visible", false)

	for node in get_tree().get_nodes_in_group("enemies"):
		print(node.name, " visible=", node.visible)

	boss.remove_from_group("enemies")
	print(get_tree().get_nodes_in_group("enemies").size())

	var found := find_child("Enemy1", false, false)
	print(found.get_path() if found else "missing")
	print(get_child_count(), " ", get_child(0).name)
