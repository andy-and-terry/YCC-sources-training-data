extends Node

func _ready():
	var enemies: Array[Node] = []
	for i in range(3):
		var n := Node.new()
		n.name = "Enemy%d" % i
		n.add_to_group("enemies")
		add_child(n)
		enemies.append(n)

	enemies[0].add_to_group("boss")
	print(get_tree().get_nodes_in_group("enemies").size())
	print(enemies[0].is_in_group("boss"), " ", enemies[1].is_in_group("boss"))
	enemies[1].remove_from_group("enemies")
	for e in get_tree().get_nodes_in_group("enemies"):
		print(e.name)
