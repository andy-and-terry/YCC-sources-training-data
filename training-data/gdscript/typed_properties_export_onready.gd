extends Node

@export var speed: float = 200.0
@export_range(0, 10, 1) var lives: int = 3
@export var tags: Array[String] = ["player"]
@export_enum("Easy", "Normal", "Hard") var difficulty: int = 1
@onready var label_text: String = "ready:%s" % name

const MAX_SPEED := 500.0
const COLORS := {"red": Color.RED, "green": Color.GREEN}

var position_cache: Vector2 = Vector2.ZERO
var _private_counter := 0

var computed: float:
	get:
		return speed * 2.0
	set(value):
		speed = value / 2.0

func _ready() -> void:
	computed = 600.0
	print(speed, " ", computed, " ", lives, " ", tags, " ", difficulty, " ", label_text)
	print(MAX_SPEED, " ", COLORS["red"], " ", COLORS.size())
	position_cache += Vector2(3, 4)
	print(position_cache.length(), " ", position_cache.normalized(), " ", position_cache.distance_to(Vector2.ZERO))
