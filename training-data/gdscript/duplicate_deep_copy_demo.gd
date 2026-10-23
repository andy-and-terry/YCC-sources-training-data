extends Node

func _ready() -> void:
	var original := {"name": "orc", "stats": {"hp": 10, "tags": ["melee"]}}
	var shallow := original.duplicate()
	var deep := original.duplicate(true)

	original["stats"]["hp"] = 99
	original["stats"]["tags"].append("boss")

	print(shallow["stats"]["hp"])
	print(deep["stats"]["hp"])
	print(shallow["stats"]["tags"])
	print(deep["stats"]["tags"])

	var arr := [[1, 2], [3]]
	var arr_copy := arr.duplicate(true)
	arr[0].append(9)
	print(arr, arr_copy)
