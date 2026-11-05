extends Node

func _ready():
	var d = {"a": 1, "b": 2, "c": 3}
	for k in d:
		print(k, " -> ", d[k])
	print(d.keys(), d.values())
	print(d.has("b"), d.get("z", -1))
