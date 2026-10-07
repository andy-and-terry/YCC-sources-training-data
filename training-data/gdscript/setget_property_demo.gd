extends Node

class Health:
	var max_hp := 100
	var hp := 100:
		set(value):
			hp = clampi(value, 0, max_hp)
			print("hp now ", hp)
		get:
			return hp

	var is_dead: bool:
		get:
			return hp <= 0

func _ready():
	var h := Health.new()
	h.hp -= 30
	h.hp += 500
	h.hp = -10
	print("dead: ", h.is_dead)
