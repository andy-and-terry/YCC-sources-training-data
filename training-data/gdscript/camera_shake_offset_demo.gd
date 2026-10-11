extends Node2D

var shake_strength := 0.0
var decay := 5.0
var rng := RandomNumberGenerator.new()

func start_shake(amount: float):
	shake_strength = amount

func _process(delta):
	if shake_strength > 0.01:
		shake_strength = lerpf(shake_strength, 0.0, decay * delta)
		position = Vector2(rng.randf_range(-1, 1), rng.randf_range(-1, 1)) * shake_strength
	else:
		position = Vector2.ZERO

func _ready():
	rng.randomize()
	start_shake(10.0)
	for i in 5:
		_process(0.1)
		print(snappedf(shake_strength, 0.01))
