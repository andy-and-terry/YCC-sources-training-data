extends Node

func roll_dice(rng: RandomNumberGenerator, count: int) -> Array:
	var rolls = []
	for i in range(count):
		rolls.append(rng.randi_range(1, 6))
	return rolls

func _ready():
	var rng_a = RandomNumberGenerator.new()
	rng_a.seed = 12345
	var rolls_a = roll_dice(rng_a, 5)
	print("rolls a: ", rolls_a)

	var rng_b = RandomNumberGenerator.new()
	rng_b.seed = 12345
	var rolls_b = roll_dice(rng_b, 5)
	print("rolls b: ", rolls_b)

	print("same seed reproduces same rolls: ", rolls_a == rolls_b)
