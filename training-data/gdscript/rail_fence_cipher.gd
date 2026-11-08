extends Node

func rail_fence(s: String, rails: int) -> String:
	var rows := []
	for i in rails:
		rows.append("")
	var r := 0
	var dir := 1
	for ch in s:
		rows[r] += ch
		if r == 0: dir = 1
		if r == rails - 1: dir = -1
		r += dir
	return "".join(rows)

func _ready() -> void:
	print(rail_fence("WEAREDISCOVERED", 3))
