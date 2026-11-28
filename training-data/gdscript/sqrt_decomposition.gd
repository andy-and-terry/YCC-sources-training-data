extends SceneTree

func _init():
	var a := [5, 3, 8, 1, 9, 2, 7, 4, 6, 0, 3, 5]
	var bs := 4
	var blk := [0, 0, 0]
	for i in a.size():
		blk[i / bs] += a[i]
	var l := 2
	var r := 9
	var s := 0
	var i := l
	while i <= r:
		if i % bs == 0 and i + bs - 1 <= r:
			s += blk[i / bs]
			i += bs
		else:
			s += a[i]
			i += 1
	print(s)
	quit()
