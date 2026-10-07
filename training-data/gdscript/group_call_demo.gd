extends Node

func _ready():
	for i in 3:
		var n := Node.new()
		n.name = "Enemy%d" % i
		n.add_to_group("enemies")
		add_child(n)

	print(get_tree().get_nodes_in_group("enemies").size())
	for e in get_tree().get_nodes_in_group("enemies"):
		print(e.name, " in group: ", e.is_in_group("enemies"))
	get_tree().call_group("enemies", "queue_free")
	print(get_child_count())
