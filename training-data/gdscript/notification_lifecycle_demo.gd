extends Node

func _notification(what: int) -> void:
	match what:
		NOTIFICATION_READY:
			print("ready")
		NOTIFICATION_PARENTED:
			print("parented to ", get_parent().name)
		NOTIFICATION_PREDELETE:
			print("about to be freed")

func _ready() -> void:
	var child := Node.new()
	child.name = "Child"
	add_child(child)
	child.queue_free()
