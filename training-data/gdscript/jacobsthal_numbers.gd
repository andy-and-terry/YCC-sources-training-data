# Jacobsthal numbers: J0=0, J1=1, Jn = J(n-1) + 2*J(n-2)
extends SceneTree

func _init() -> void:
	var a := 0
	var b := 1
	var terms: PackedStringArray = []
	for i in 15:
		terms.append(str(a))
		var next := b + 2 * a
		a = b
		b = next
	print(" ".join(terms))
	quit()
