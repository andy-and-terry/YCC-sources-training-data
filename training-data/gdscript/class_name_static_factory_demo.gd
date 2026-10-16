extends RefCounted
class_name Enemy

var kind: String
var hp: int

func _init(p_kind: String = "slime", p_hp: int = 10):
	kind = p_kind
	hp = p_hp

static func boss() -> Enemy:
	return Enemy.new("dragon", 500)

static func from_dict(d: Dictionary) -> Enemy:
	return Enemy.new(d.get("kind", "slime"), d.get("hp", 10))

func _to_string() -> String:
	return "%s(%d)" % [kind, hp]

func demo():
	print(Enemy.boss())
	print(Enemy.from_dict({"kind": "bat"}))
	print(Enemy.new())
