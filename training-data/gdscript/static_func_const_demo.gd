extends Node

const GRAVITY := 9.8
const COLORS = {"red": Color.RED, "green": Color.GREEN}
const PRIMES = [2, 3, 5, 7]

static var instance_count := 0

static func clamp_speed(speed: float, limit: float = 10.0) -> float:
	return min(speed, limit)

static func fall_distance(t: float) -> float:
	return 0.5 * GRAVITY * t * t

func _ready():
	instance_count += 1
	print(clamp_speed(25.0), " ", fall_distance(2.0))
	print(PRIMES.size(), " ", COLORS.keys(), " ", instance_count)
