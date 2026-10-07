extends Node

@export var max_health: int = 100
@export var player_name: String = "Hero"
@export_range(0, 1) var speed_multiplier: float = 1.0

var health: int

func _ready():
	health = max_health
	print(player_name, " starts with ", health, " HP")
	print("Speed multiplier: ", speed_multiplier)
