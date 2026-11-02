extends Node

signal health_changed(new_value)

var health := 100

func _ready():
    health_changed.connect(_on_health)
    take_damage(30)

func take_damage(n):
    health -= n
    health_changed.emit(health)

func _on_health(v):
    print("health:", v)
