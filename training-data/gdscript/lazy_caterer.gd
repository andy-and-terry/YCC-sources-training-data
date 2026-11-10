extends SceneTree

func pieces(cuts: int) -> int:
	return (cuts * cuts + cuts + 2) / 2

func _init() -> void:
	var out := []
	for n in range(10):
		out.append(pieces(n))
	print(out) # [1, 2, 4, 7, 11, 16, 22, 29, 37, 46]
	quit()
