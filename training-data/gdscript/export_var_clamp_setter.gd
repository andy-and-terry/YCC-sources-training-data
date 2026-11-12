extends Node
@export var health: int = 100:
    set(v):
        health = clampi(v, 0, 100)
func _ready():
    health = 150
    print(health)
