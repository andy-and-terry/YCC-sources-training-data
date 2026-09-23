extends Node

func _ready():
	var save_data = {
		"player_name": "Aria",
		"level": 5,
		"inventory": ["sword", "shield", "potion"]
	}

	var json_text = JSON.stringify(save_data)
	print(json_text)

	var loaded = JSON.parse_string(json_text)
	print(loaded["player_name"], " is level ", loaded["level"])
	print(loaded["inventory"])
