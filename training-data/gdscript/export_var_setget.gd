extends Node

@export var speed: float = 200.0
@export_range(0, 100) var armor: int = 10

var _hp := 100
var hp: int:
    get: return _hp
    set(v): _hp = clamp(v, 0, 100)

func _ready():
    hp = 250
    print(hp)
