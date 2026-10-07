extends Node

class RealImage:
	var filename: String

	func _init(f: String) -> void:
		filename = f
		print("loading image from disk: %s" % filename)

	func display() -> void:
		print("displaying %s" % filename)

class ImageProxy:
	var filename: String
	var _real_image: RealImage = null

	func _init(f: String) -> void:
		filename = f

	func display() -> void:
		if _real_image == null:
			_real_image = RealImage.new(filename)
		_real_image.display()

func _ready():
	var proxy := ImageProxy.new("landscape.png")
	print("proxy created, image not loaded yet")
	proxy.display()
	proxy.display()
