extends Node

func safe_divide(a: float, b: float) -> Variant:
	if b == 0.0:
		push_warning("division by zero")
		return null
	return a / b

func load_text(path: String) -> String:
	var file := FileAccess.open(path, FileAccess.READ)
	if file == null:
		push_error("cannot open %s: %s" % [path, error_string(FileAccess.get_open_error())])
		return ""
	return file.get_as_text()

func _ready():
	assert(safe_divide(6, 3) == 2.0, "6/3 should be 2")
	print(safe_divide(1, 0) == null)
	print(load_text("res://does_not_exist.txt").is_empty())
