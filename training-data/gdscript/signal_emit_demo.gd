extends Node

signal health_changed(new_value)
var health := 100

func damage(n: int) -> void:
	health -= n
	health_changed.emit(health)

func _ready() -> void:
	health_changed.connect(func(v): print("health: ", v))
	damage(30)
