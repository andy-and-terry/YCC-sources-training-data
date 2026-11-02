extends Node2D

var target := Vector2(100, 50)

func _process(delta):
    position = position.move_toward(target, 60.0 * delta)
    if position.distance_to(target) < 1.0:
        set_process(false)
