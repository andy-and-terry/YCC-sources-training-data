extends Node

func swap_case(s: String) -> String:
	var out := ""
	for c in s:
		out += c.to_lower() if c == c.to_upper() and c != c.to_lower() else c.to_upper()
	return out

func _ready() -> void:
	print(swap_case("Hello World 42"))
