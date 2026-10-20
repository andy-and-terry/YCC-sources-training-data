extends Node

func _ready() -> void:
	var path := "user://demo_save.json"
	var data := {"name": "Ada", "score": 42, "items": ["sword", "shield"], "pos": {"x": 1.5, "y": 2.0}}
	var f := FileAccess.open(path, FileAccess.WRITE)
	f.store_string(JSON.stringify(data, "\t"))
	f.close()
	print(FileAccess.file_exists(path))
	var text := FileAccess.get_file_as_string(path)
	var parsed = JSON.parse_string(text)
	print(parsed["name"], " ", parsed["items"].size(), " ", parsed["pos"]["x"])
	var json := JSON.new()
	print(json.parse("{bad json") != OK, " ", json.get_error_message() != "")
	var cfg := ConfigFile.new()
	cfg.set_value("player", "name", "Ada")
	cfg.set_value("audio", "volume", 0.8)
	cfg.save("user://demo.cfg")
	var loaded := ConfigFile.new()
	print(loaded.load("user://demo.cfg") == OK, " ", loaded.get_value("audio", "volume"), " ", loaded.get_value("x", "y", "default"))
	DirAccess.remove_absolute(ProjectSettings.globalize_path(path))
	print(FileAccess.file_exists(path))
