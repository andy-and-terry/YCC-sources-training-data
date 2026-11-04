extends Node

func zigzag(s: String, rows: int) -> String:
	if rows == 1 or rows >= s.length():
		return s
	var lines: Array[String] = []
	lines.resize(rows)
	lines.fill("")
	var r := 0
	var step := 1
	for c in s:
		lines[r] += c
		if r == 0:
			step = 1
		elif r == rows - 1:
			step = -1
		r += step
	return "".join(lines)

func _ready() -> void:
	print(zigzag("PAYPALISHIRING", 3))
