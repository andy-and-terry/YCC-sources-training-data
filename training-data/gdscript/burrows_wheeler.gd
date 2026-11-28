extends SceneTree

func bwt(s: String) -> String:
	var rots: Array[String] = []
	for i in s.length():
		rots.append(s.substr(i) + s.substr(0, i))
	rots.sort()
	var out := ""
	for r in rots:
		out += r[r.length() - 1]
	return out

func _init():
	print(bwt("banana$"))
	quit()
