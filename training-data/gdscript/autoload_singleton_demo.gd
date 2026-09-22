extends Node

class GameState:
	static var _instance: GameState

	var score: int = 0
	var level: int = 1

	static func get_instance() -> GameState:
		if _instance == null:
			_instance = GameState.new()
		return _instance

	func add_score(points: int) -> void:
		score += points

func _ready():
	var a = GameState.get_instance()
	a.add_score(10)
	var b = GameState.get_instance()
	b.add_score(5)
	print(a == b, a.score)
