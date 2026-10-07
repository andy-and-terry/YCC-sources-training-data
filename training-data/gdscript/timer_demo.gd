extends Node

var ticks := 0

func _ready():
	var t := Timer.new()
	t.wait_time = 0.1
	t.one_shot = false
	t.timeout.connect(_on_tick.bind(t))
	add_child(t)
	t.start()

	await get_tree().create_timer(0.55).timeout
	print("done after ", ticks, " ticks")

func _on_tick(t: Timer):
	ticks += 1
	print("tick ", ticks)
	if ticks >= 3:
		t.stop()
