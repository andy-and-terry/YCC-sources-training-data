extends Node2D

@export var speed: float = 200.0
@export_range(0, 10) var level: int = 1
@onready var sprite: Sprite2D = $Sprite2D

func _process(delta: float) -> void:
	position.x += speed * delta
