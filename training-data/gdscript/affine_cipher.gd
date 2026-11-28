extends Node

func affine(s: String, a: int, b: int) -> String:
	var out := ""
	for ch in s:
		var x := ch.unicode_at(0) - 65
		out += char(65 + (a * x + b) % 26)
	return out

func _ready() -> void:
	print(affine("AFFINE", 5, 8))
