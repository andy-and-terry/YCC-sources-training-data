extends SceneTree

# Vector2 projection, sliding along a wall and bouncing off it.

func _init() -> void:
	var velocity := Vector2(4, -3)
	var wall_normal := Vector2.UP   # wall faces upward

	# slide removes the component going into the surface
	print("slide:  ", velocity.slide(wall_normal))
	# bounce reflects it
	print("bounce: ", velocity.bounce(wall_normal))
	# reflect mirrors across the line, not the normal
	print("reflect:", velocity.reflect(wall_normal))

	# project onto an axis
	var axis := Vector2(1, 1).normalized()
	print("project:", velocity.project(axis))

	# angle_to gives the signed angle between two vectors
	print("angle:  ", snappedf(rad_to_deg(Vector2.RIGHT.angle_to(velocity)), 0.01))
	quit()
