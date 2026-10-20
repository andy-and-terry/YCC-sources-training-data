extends Node

signal finished(result: int)

func slow_square(n: int) -> int:
	await get_tree().create_timer(0.01).timeout
	return n * n

func background() -> void:
	await get_tree().process_frame
	finished.emit(42)

func _ready() -> void:
	var a: int = await slow_square(3)
	var b: int = await slow_square(4)
	print(a + b)
	background()
	var r: int = await finished
	print("finished with ", r)
	var results := []
	for i in 3:
		results.append(await slow_square(i))
	print(results)
