extends Node

class MonsterPrototype:
	var species: String
	var hp: int
	var attack: int

	func _init(s: String, h: int, a: int) -> void:
		species = s
		hp = h
		attack = a

	func clone() -> MonsterPrototype:
		return MonsterPrototype.new(species, hp, attack)

func _ready():
	var goblin_template := MonsterPrototype.new("Goblin", 20, 5)
	var goblin1 := goblin_template.clone()
	var goblin2 := goblin_template.clone()
	goblin2.hp = 15
	print("template hp: %d" % goblin_template.hp)
	print("goblin1 hp: %d, goblin2 hp: %d" % [goblin1.hp, goblin2.hp])
