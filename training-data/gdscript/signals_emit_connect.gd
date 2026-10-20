extends Node

signal health_changed(old_value: int, new_value: int)
signal died

var health: int = 100:
	set(value):
		var old := health
		health = clampi(value, 0, 100)
		health_changed.emit(old, health)
		if health == 0:
			died.emit()

func _ready() -> void:
	health_changed.connect(_on_health_changed)
	died.connect(func(): print("player died"), CONNECT_ONE_SHOT)
	take_damage(30)
	take_damage(200)

func take_damage(amount: int) -> void:
	health -= amount

func _on_health_changed(old_value: int, new_value: int) -> void:
	print("health %d -> %d" % [old_value, new_value])
