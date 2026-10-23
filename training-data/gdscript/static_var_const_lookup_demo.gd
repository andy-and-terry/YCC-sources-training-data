extends Node

const MAX_LEVEL := 5
const NAMES := ["novice", "adept", "master"]

static func clamp_level(level: int) -> int:
	return clampi(level, 1, MAX_LEVEL)

static func title_for(level: int) -> String:
	return NAMES[mini(level / 2, NAMES.size() - 1)]

func _ready():
	print(clamp_level(9), " ", clamp_level(-3))
	print(title_for(1), " ", title_for(4))
