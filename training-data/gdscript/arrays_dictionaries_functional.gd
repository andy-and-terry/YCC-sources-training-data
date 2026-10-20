extends Node

func _ready() -> void:
	var nums := [5, 3, 8, 1, 9, 2]
	nums.sort()
	print(nums, " ", nums.size(), " ", nums.max(), " ", nums.min())
	print(nums.filter(func(n): return n % 2 == 1))
	print(nums.map(func(n): return n * n))
	print(nums.reduce(func(acc, n): return acc + n, 0))
	print(nums.any(func(n): return n > 8), " ", nums.all(func(n): return n > 0))
	print(nums.slice(1, 4), " ", nums.find(8), " ", nums.has(7), " ", nums.back(), " ", nums.front())
	nums.append(7)
	nums.insert(0, 100)
	nums.erase(100)
	nums.reverse()
	print(nums, nums.pop_back(), nums.pop_front())
	var d := {"a": 1, "b": 2}
	d["c"] = 3
	print(d.keys(), d.values(), d.has("a"), d.get("z", -1), d.size())
	for k in d:
		print(k, "=", d[k])
	d.erase("a")
	var merged := d.duplicate()
	merged.merge({"x": 10, "b": 99}, true)
	print(merged)
	var matrix := [[1, 2], [3, 4]]
	print(matrix[1][0], " ", matrix.map(func(r): return r.size()))
