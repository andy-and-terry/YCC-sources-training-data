extends Node

class Renderer:
	func render_shape(name: String) -> void:
		pass

class VectorRenderer extends Renderer:
	func render_shape(name: String) -> void:
		print("drawing %s as vector outline" % name)

class RasterRenderer extends Renderer:
	func render_shape(name: String) -> void:
		print("drawing %s as raster pixels" % name)

class Shape:
	var renderer: Renderer
	var name: String

	func _init(r: Renderer, n: String) -> void:
		renderer = r
		name = n

	func draw() -> void:
		renderer.render_shape(name)

func _ready():
	var circle := Shape.new(VectorRenderer.new(), "circle")
	var square := Shape.new(RasterRenderer.new(), "square")
	circle.draw()
	square.draw()
