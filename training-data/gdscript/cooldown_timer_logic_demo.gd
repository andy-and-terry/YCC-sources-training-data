extends Node

var cooldown := 0.0
const COOLDOWN_TIME := 0.5

func try_fire() -> bool:
	if cooldown > 0.0:
		return false
	cooldown = COOLDOWN_TIME
	return true

func _process(delta):
	cooldown = max(0.0, cooldown - delta)

func _ready():
	print(try_fire())
	print(try_fire())
	_process(0.3)
	print(try_fire())
	_process(0.3)
	print(try_fire())
