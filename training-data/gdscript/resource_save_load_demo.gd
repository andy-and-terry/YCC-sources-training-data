extends Node

class_name SaveHelper

func save_text(path: String, text: String) -> bool:
	var f = FileAccess.open(path, FileAccess.WRITE)
	if f == null:
		push_error("cannot open: %s" % error_string(FileAccess.get_open_error()))
		return false
	f.store_line(text)
	f.close()
	return true

func load_text(path: String) -> String:
	if not FileAccess.file_exists(path):
		return ""
	var f = FileAccess.open(path, FileAccess.READ)
	var text = f.get_as_text()
	f.close()
	return text

func _ready():
	save_text("user://demo.txt", "hello save")
	print(load_text("user://demo.txt").strip_edges())
	print(load_text("user://missing.txt") == "")
