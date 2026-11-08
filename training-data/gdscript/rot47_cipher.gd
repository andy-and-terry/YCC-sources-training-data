extends Node

func rot47(s: String) -> String:
	var out := ""
	for ch in s:
		var n := ch.unicode_at(0)
		if n >= 33 and n <= 126:
			out += char(33 + (n - 33 + 47) % 94)
		else:
			out += ch
	return out

func _ready() -> void:
	var e := rot47("Hello, World!")
	print(e)
	print(rot47(e))
