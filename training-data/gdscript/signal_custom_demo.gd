extends Node

signal health_changed(new_health)

var health = 100

func take_damage(amount: int):
	health -= amount
	health_changed.emit(health)

func _on_health_changed(new_health):
	print("Health is now: ", new_health)

func _ready():
	health_changed.connect(_on_health_changed)
	take_damage(30)
