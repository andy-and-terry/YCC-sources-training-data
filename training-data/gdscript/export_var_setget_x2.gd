extends Node

@export var speed: float = 5.0:
    set(v):
        speed = clamp(v, 0.0, 10.0)

func _ready():
    speed = 50.0
    print(speed)
