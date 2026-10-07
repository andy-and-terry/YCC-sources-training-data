extends Node

class Player:
	var name: String
	var score: int

	func _init(n: String, s: int):
		name = n
		score = s

func _ready():
	var players: Array[Player] = [
		Player.new("Cleo", 80),
		Player.new("Ada", 95),
		Player.new("Bob", 80),
	]

	players.sort_custom(func(a, b):
		if a.score != b.score:
			return a.score > b.score
		return a.name < b.name)
	for p in players:
		print(p.name, " ", p.score)

	var names := players.map(func(p): return p.name)
	names.sort()
	print(names)

	var nums := [4, 1, 3, 9]
	nums.sort()
	print(nums, " ", nums.bsearch(3))
	nums.reverse()
	print(nums, " ", nums.max(), " ", nums.min())

	var best := players.filter(func(p): return p.score > 90)
	print(best.size(), " ", players.any(func(p): return p.score < 85))
	var total := players.reduce(func(acc, p): return acc + p.score, 0)
	print(total)
