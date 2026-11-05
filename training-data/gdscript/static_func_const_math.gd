extends Node

const TAU_HALF = PI

static func deg_to_rad_x(d: float) -> float:
	return d * TAU_HALF / 180.0

func _ready():
	print(deg_to_rad_x(180.0))
