extends Node

func shuffle(arr: Array, rng: RandomNumberGenerator) -> void:
	for i in range(arr.size() - 1, 0, -1):
		var j = rng.randi_range(0, i)
		var tmp = arr[i]
		arr[i] = arr[j]
		arr[j] = tmp

func _ready():
	var deck = [1, 2, 3, 4, 5, 6, 7, 8]
	var rng = RandomNumberGenerator.new()
	rng.seed = 42
	shuffle(deck, rng)
	print(deck)
