extends SceneTree

func _init():
	var n := 8
	for r in n:
		var line := " ".repeat(n - r - 1)
		for c in range(r + 1):
			line += "* " if (r & c) == c else "  "
		print(line)
	quit()
