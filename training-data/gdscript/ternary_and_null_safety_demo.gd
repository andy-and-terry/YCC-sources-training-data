extends Node

class Player:
	var name: String
	var weapon: Dictionary = {}

	func _init(n: String):
		name = n

func weapon_name(p: Player) -> String:
	return p.weapon.get("name", "fists")

func _ready():
	var hp := 35
	var status := "healthy" if hp > 50 else "wounded" if hp > 0 else "dead"
	print(status)

	var maybe: Variant = null
	print(maybe if maybe != null else "default")
	print(str(maybe) == "<null>")

	var p := Player.new("Zed")
	print(weapon_name(p))
	p.weapon = {"name": "sword", "damage": 7}
	print(weapon_name(p))

	var config := {"volume": 0}
	print(config.get("volume", 50))
	print(config.get("missing", 50))
	print(config.has("volume") and config["volume"] == 0)

	var node = get_node_or_null("DoesNotExist")
	print(node == null)
	print(is_instance_valid(node))
	print(not (hp > 10 and hp < 20) or false)
