extends Node

class Character:
	var char_name: String = ""
	var strength: int = 0
	var agility: int = 0

	func describe() -> String:
		return "%s (str=%d, agi=%d)" % [char_name, strength, agility]

class CharacterBuilder:
	var character: Character = Character.new()

	func set_name(n: String) -> CharacterBuilder:
		character.char_name = n
		return self

	func set_strength(s: int) -> CharacterBuilder:
		character.strength = s
		return self

	func set_agility(a: int) -> CharacterBuilder:
		character.agility = a
		return self

	func build() -> Character:
		return character

func _ready():
	var hero = CharacterBuilder.new() \
		.set_name("Aria") \
		.set_strength(8) \
		.set_agility(12) \
		.build()
	print(hero.describe())
