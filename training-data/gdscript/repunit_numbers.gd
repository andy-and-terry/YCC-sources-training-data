extends SceneTree

# Repunits: R_n = 11...1 (n ones), built as R_{n-1}*10 + 1.
func _init() -> void:
	var r := 0
	for n in range(1, 9):
		r = r * 10 + 1
		print(str(r) + ("  (divisible by 3)" if r % 3 == 0 else ""))
	quit()
