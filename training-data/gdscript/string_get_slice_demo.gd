extends SceneTree

# get_slice picks one piece of a delimited string without
# building a full array; rsplit splits starting from the right.

func _init() -> void:
	var path := "user://saves/slot_2/profile.json"

	print(path.get_slice("/", 0))   # user:
	print(path.get_slice("/", 3))   # slot_2
	print(path.get_slice_count("/")) # 5

	# Limit splits from the right: keep the file name apart
	var parts := path.rsplit("/", true, 1)
	print(parts)                    # [user://saves/slot_2, profile.json]

	var file_name: String = parts[1]
	print(file_name.get_basename(), " | ", file_name.get_extension())

	# Out of range index returns an empty string
	print("[", path.get_slice("/", 99), "]")
	quit()
