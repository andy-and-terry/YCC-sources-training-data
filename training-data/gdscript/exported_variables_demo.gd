extends Node

@export var player_name: String = "Hero"
@export_range(0, 100) var health: int = 100
@export_enum("Easy", "Normal", "Hard") var difficulty: int = 1
@export_flags("Fire", "Water", "Earth", "Air") var resistances: int = 0

@export_group("Movement")
@export var speed: float = 5.0
@export var jump_height: float = 2.0

func _ready():
	print(player_name, " hp=", health, " difficulty=", difficulty)
	print("speed=", speed, " jump_height=", jump_height)
	print("resistance flags=", resistances)
