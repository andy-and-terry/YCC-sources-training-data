extends SceneTree

func lis_length(a: Array) -> int:
	var tails: Array = []
	for x in a:
		var i := tails.bsearch(x)
		if i == tails.size():
			tails.append(x)
		else:
			tails[i] = x
	return tails.size()

func _init():
	print(lis_length([10, 9, 2, 5, 3, 7, 101, 18]))
	quit()
