extends Node

func shift(text: String, k: int) -> String:
	var out := ""
	for ch in text:
		var c := ch.unicode_at(0)
		if c >= 97 and c <= 122:
			out += char((c - 97 + k + 26) % 26 + 97)
		elif c >= 65 and c <= 90:
			out += char((c - 65 + k + 26) % 26 + 65)
		else:
			out += ch
	return out

func _ready():
	var enc := shift("Hello, World!", 3)
	print(enc)
	print(shift(enc, -3))
