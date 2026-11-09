class_name Weapon
extends Resource

@export var damage: int = 10
@export var name: String = "Sword"

func describe() -> String:
	return "%s (%d dmg)" % [name, damage]
