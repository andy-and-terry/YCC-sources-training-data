extends Node

func countdown(n: int):
	while n > 0:
		print(n)
		await get_tree().create_timer(0.1).timeout
		n -= 1
	print("liftoff")

func wait_frames(count: int):
	for i in count:
		await get_tree().process_frame
	return count

func _ready():
	await countdown(3)
	var frames = await wait_frames(2)
	print("waited ", frames, " frames")
