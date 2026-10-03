extends Node

class GameLevel:
	func play() -> void:
		load_level()
		spawn_enemies()
		if has_boss():
			spawn_boss()
		finish_level()

	func load_level() -> void:
		print("loading level")

	func spawn_enemies() -> void:
		pass

	func has_boss() -> bool:
		return false

	func spawn_boss() -> void:
		pass

	func finish_level() -> void:
		print("level complete")

class ForestLevel extends GameLevel:
	func spawn_enemies() -> void:
		print("spawning wolves")

class CastleLevel extends GameLevel:
	func spawn_enemies() -> void:
		print("spawning knights")

	func has_boss() -> bool:
		return true

	func spawn_boss() -> void:
		print("spawning the dragon boss")

func _ready():
	ForestLevel.new().play()
	CastleLevel.new().play()
