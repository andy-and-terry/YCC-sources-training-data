extends Node

@export var move_speed: float = 100.0
@export var gravity: float = 980.0

var position: Vector2 = Vector2.ZERO
var velocity: Vector2 = Vector2.ZERO

func _process(delta: float) -> void:
	position.x += move_speed * delta
	print("frame position: ", position)

func _physics_process(delta: float) -> void:
	velocity.y += gravity * delta
	position.y += velocity.y * delta
	print("physics position: ", position)

func _ready():
	# No engine loop is driving this script here, so simulate a few frames
	# with fixed delta values to show how _process and _physics_process differ.
	for i in range(3):
		_process(0.1)
		_physics_process(0.02)
