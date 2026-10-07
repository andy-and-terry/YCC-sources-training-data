extends Node

const MAX_LEVEL := 5
const COLORS := ["red", "green", "blue"]
const LIMITS := {"min": 0, "max": 100}

static var instance_count: int = 0

class Enemy:
	static var total_created := 0
	var hp: int

	func _init(start_hp: int = 10):
		hp = start_hp
		total_created += 1

	static func describe() -> String:
		return "%d enemies created" % total_created

enum Difficulty { EASY, NORMAL = 5, HARD }

func _ready():
	print(MAX_LEVEL, COLORS[1], LIMITS["max"])
	Enemy.new()
	Enemy.new(25)
	print(Enemy.describe())
	print(Difficulty.EASY, Difficulty.NORMAL, Difficulty.HARD)
	print(Difficulty.keys(), Difficulty.values())
	print(Difficulty.find_key(6))
	instance_count += 1
	print(instance_count)
