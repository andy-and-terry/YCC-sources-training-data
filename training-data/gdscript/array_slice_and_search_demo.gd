extends Node

func _ready():
	var items := [10, 20, 30, 40, 50, 60]
	print(items.slice(1, 4))
	print(items.slice(2))
	print(items.slice(-2))
	print(items.slice(0, 6, 2))
	print(items.find(30), items.find(99))
	print(items.has(40))
	print(items.count(10))
	print(items.bsearch(35))
	print(items.min(), items.max())
	print(items.front(), items.back())

	var copy := items.duplicate()
	copy.reverse()
	print(copy)
	copy.insert(1, 999)
	copy.erase(999)
	copy.remove_at(0)
	print(copy)
	print(items.filter(func(x): return x > 25))
	print(items.map(func(x): return x / 10))
	print(items.reduce(func(acc, x): return acc + x, 0))
	print(items.any(func(x): return x > 55), items.all(func(x): return x > 15))
	print(items.pick_random() in items)
