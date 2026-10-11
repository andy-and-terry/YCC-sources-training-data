extends Node

func weighted_pick(items: Array, weights: Array, rng: RandomNumberGenerator):
	var total = 0.0
	for w in weights:
		total += w
	var r = rng.randf() * total
	var acc = 0.0
	for i in items.size():
		acc += weights[i]
		if r < acc:
			return items[i]
	return items[-1]

func _ready():
	var rng = RandomNumberGenerator.new()
	rng.seed = 12345
	var counts = {"common": 0, "rare": 0, "epic": 0}
	for i in 1000:
		var k = weighted_pick(["common", "rare", "epic"], [70, 25, 5], rng)
		counts[k] += 1
	print(counts["common"] > counts["rare"], counts["rare"] > counts["epic"])
