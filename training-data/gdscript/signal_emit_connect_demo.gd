extends Node

signal health_changed(old_value: int, new_value: int)

var health := 100

func take_damage(amount: int) -> void:
	var old := health
	health = max(0, health - amount)
	health_changed.emit(old, health)

func _on_health_changed(old_value: int, new_value: int) -> void:
	print("health ", old_value, " -> ", new_value)

func _ready():
	health_changed.connect(_on_health_changed)
	take_damage(30)
	take_damage(200)
	print(health_changed.is_connected(_on_health_changed))
