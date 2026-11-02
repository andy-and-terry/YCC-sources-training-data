extends Node

func _ready():
    print("start")
    await get_tree().create_timer(0.5).timeout
    print("half a second later")
