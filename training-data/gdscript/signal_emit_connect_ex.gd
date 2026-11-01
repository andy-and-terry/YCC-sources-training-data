extends Node

signal health_changed(old_value, new_value)

var health := 100:
	set(v):
		health_changed.emit(health, v)
		health = v

func _ready():
	health_changed.connect(func(o, n): print("hp %d -> %d" % [o, n]))
	health = 80
