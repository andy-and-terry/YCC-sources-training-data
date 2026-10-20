extends Node

signal health_changed(new_value)

var health := 100

func _ready():
	health_changed.connect(func(v): print("hp ", v))
	take_damage(30)

func take_damage(n: int) -> void:
	health = max(0, health - n)
	health_changed.emit(health)
