extends SceneTree

func _init() -> void:
	var limit := 80
	var composite := []
	composite.resize(limit + 1)
	composite.fill(false)
	var i := 2
	while i * i <= limit:
		if not composite[i]:
			for j in range(i * i, limit + 1, i):
				composite[j] = true
		i += 1
	var pairs := []
	for p in range(3, limit - 1):
		if not composite[p] and not composite[p + 2]:
			pairs.append(Vector2i(p, p + 2))
	print(pairs) # [(3, 5), (5, 7), (11, 13), (17, 19), (29, 31), (41, 43), (59, 61), (71, 73)]
	quit()
