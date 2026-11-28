extends SceneTree

func escape(cr: float, ci: float) -> int:
	var zr := 0.0
	var zi := 0.0
	for n in 30:
		if zr * zr + zi * zi >= 4.0:
			return n
		var t := zr * zr - zi * zi + cr
		zi = 2.0 * zr * zi + ci
		zr = t
	return 30

func _init():
	for yi in range(-5, 6):
		var line := ""
		for xi in range(-40, 13):
			line += "#" if escape(xi / 20.0, yi / 5.0) == 30 else "."
		print(line)
	quit()
