extends SceneTree

func encode(text: String, rails: int) -> String:
	var rows: Array[String] = []
	rows.resize(rails)
	rows.fill("")
	var r := 0
	var step := 1
	for ch in text:
		rows[r] += ch
		if r == 0: step = 1
		elif r == rails - 1: step = -1
		r += step
	return "".join(rows)

func _init() -> void:
	print(encode("WEAREDISCOVERED", 3))
	quit()
