extends Node

func _ready():
	var a = [1, 2, 3, 4, 5]
	a.reverse()
	print(a)
	seed(42)
	a.shuffle()
	print(a.size())
	a.sort()
	print(a)
	print(a.pick_random() in a)
	print(a.has(3), a.find(4), a.count(2))
	a.insert(1, 99)
	a.erase(99)
	print(a.pop_front(), a.pop_back(), a)
