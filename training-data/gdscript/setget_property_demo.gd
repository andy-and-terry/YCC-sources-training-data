extends Node

class Health:
	signal changed(old_value, new_value)

	var max_hp: int = 100
	var hp: int = 100:
		set(value):
			var clamped := clampi(value, 0, max_hp)
			if clamped != hp:
				var old := hp
				hp = clamped
				changed.emit(old, hp)
		get:
			return hp

	var percent: float:
		get:
			return float(hp) / max_hp * 100.0

	var is_dead: bool:
		get:
			return hp <= 0

func _ready():
	var h := Health.new()
	h.changed.connect(func(old_value, new_value): print("hp %d -> %d" % [old_value, new_value]))
	h.hp -= 30
	h.hp -= 30
	print(h.percent)
	h.hp = 500
	h.hp = -20
	print(h.is_dead)
	h.hp = 100
	print(h.is_dead)
