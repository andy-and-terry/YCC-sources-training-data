extends Node

func _ready():
	var inv := {"sword": 1, "potion": 3}
	inv["arrow"] = 20
	for item in inv:
		print(item, " x", inv[item])
	print(inv.has("potion"), inv.keys(), inv.get("shield", 0))
