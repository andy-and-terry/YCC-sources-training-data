extends SceneTree

# Rect2 helpers for simple overlap and containment checks.

func _init() -> void:
	var a := Rect2(0, 0, 10, 10)
	var b := Rect2(5, 5, 10, 10)
	var c := Rect2(20, 20, 4, 4)

	print("a hits b: ", a.intersects(b))
	print("a hits c: ", a.intersects(c))
	print("overlap: ", a.intersection(b))
	print("merged: ", a.merge(c))

	print("a has (3,3): ", a.has_point(Vector2(3, 3)))
	print("a encloses small: ", a.encloses(Rect2(1, 1, 2, 2)))

	# grow expands equally on all sides
	var padded := a.grow(2)
	print("padded: ", padded, " area=", padded.get_area())
	print("center: ", padded.get_center())
	quit()
