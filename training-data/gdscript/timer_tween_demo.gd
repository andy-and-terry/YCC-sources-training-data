extends Node2D

var elapsed := 0.0

func _ready():
	var timer := Timer.new()
	timer.wait_time = 0.5
	timer.one_shot = false
	timer.timeout.connect(_on_timer_timeout)
	add_child(timer)
	timer.start()

	var tween := create_tween()
	tween.tween_property(self, "position", Vector2(100, 0), 1.0).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)
	tween.tween_property(self, "modulate:a", 0.0, 0.5)
	tween.tween_callback(queue_free)

	await get_tree().create_timer(2.0).timeout
	print("two seconds passed")

func _on_timer_timeout():
	elapsed += 0.5
	print("tick ", elapsed)
