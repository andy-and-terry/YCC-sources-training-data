extends Node

class EventBus:
	signal player_scored(points: int)
	signal player_died

var total_score = 0

func _on_scored(points):
	total_score += points
	print("score event: +", points, " (total ", total_score, ")")

func _on_died():
	print("death event received")

func _ready():
	var bus = EventBus.new()
	bus.player_scored.connect(_on_scored)
	bus.player_died.connect(_on_died)
	bus.player_scored.emit(10)
	bus.player_scored.emit(25)
	bus.player_died.emit()
