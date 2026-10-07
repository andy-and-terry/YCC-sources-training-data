extends Node

func _ready():
	var a := [5, 2, 9, 1, 7]
	print(a.slice(1, 4), " ", a.slice(-2), " ", a.slice(0, 5, 2))
	a.sort_custom(func(x, y): return x > y)
	print(a)
	print(a.min(), " ", a.max(), " ", a.find(9), " ", a.count(2))
	a.insert(2, 100)
	a.erase(100)
	a.reverse()
	print(a, " ", a.pop_back(), " ", a.pop_front())
	var words := ["pear", "fig", "apple"]
	words.sort_custom(func(x, y): return x.length() < y.length())
	print(words, " ", [1, 2, 3].any(func(n): return n > 2), " ", [1, 2].all(func(n): return n > 1))
	print(a.duplicate(), " ", a.bsearch(5))
