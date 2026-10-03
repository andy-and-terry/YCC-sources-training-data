interface Renderer {
    fun renderShape(name: String)
}

class VectorRenderer : Renderer {
    override fun renderShape(name: String) = println("drawing $name as vector outline")
}

class RasterRenderer : Renderer {
    override fun renderShape(name: String) = println("drawing $name as raster pixels")
}

class Shape(private val renderer: Renderer, private val name: String) {
    fun draw() = renderer.renderShape(name)
}

fun main() {
    val circle = Shape(VectorRenderer(), "circle")
    val square = Shape(RasterRenderer(), "square")
    circle.draw()
    square.draw()
}
