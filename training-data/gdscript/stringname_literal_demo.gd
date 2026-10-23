extends Node

func _ready() -> void:
	var a: StringName = &"attack"
	var b: StringName = StringName("attack")
	print(a == b)
	print(a == "attack")
	print(String(a).to_upper())
	print(a.length())

	var actions := {&"jump": 1, &"run": 2}
	print(actions[&"jump"])
	print(actions.has(&"run"))
