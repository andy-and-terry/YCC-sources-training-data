extends Node

func encrypt(text: String, k: int) -> String:
	var cycle := 2 * (k - 1)
	var rails: Array = []
	for r in k:
		rails.append("")
	for i in text.length():
		var r := i % cycle
		if r >= k:
			r = cycle - r
		rails[r] += text[i]
	return "".join(rails)

func _ready() -> void:
	print(encrypt("WEAREDISCOVERED", 3))
