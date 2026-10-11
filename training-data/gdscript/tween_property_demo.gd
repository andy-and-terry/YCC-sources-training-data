extends Node2D

func _ready():
	var tween = create_tween()
	tween.set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT)
	tween.tween_property(self, "position", Vector2(200, 100), 1.0)
	tween.tween_property(self, "modulate:a", 0.0, 0.5)
	tween.tween_callback(queue_free)
	tween.finished.connect(func(): print("tween done"))

	var parallel = create_tween().set_parallel(true)
	parallel.tween_property(self, "scale", Vector2(2, 2), 0.5)
	parallel.tween_property(self, "rotation", PI, 0.5)
