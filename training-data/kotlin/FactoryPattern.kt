interface Shape {
    fun area(): Double
}

class Circle(private val radius: Double) : Shape {
    override fun area(): Double = Math.PI * radius * radius
}

class Rectangle(private val width: Double, private val height: Double) : Shape {
    override fun area(): Double = width * height
}

class Triangle(private val base: Double, private val height: Double) : Shape {
    override fun area(): Double = 0.5 * base * height
}

object ShapeFactory {
    fun create(kind: String, vararg dimensions: Double): Shape = when (kind) {
        "circle" -> Circle(dimensions[0])
        "rectangle" -> Rectangle(dimensions[0], dimensions[1])
        "triangle" -> Triangle(dimensions[0], dimensions[1])
        else -> throw IllegalArgumentException("Unknown shape: $kind")
    }
}

fun main() {
    val shapes = listOf(
        ShapeFactory.create("circle", 2.0),
        ShapeFactory.create("rectangle", 3.0, 4.0),
        ShapeFactory.create("triangle", 6.0, 5.0)
    )
    for (shape in shapes) println(shape.area())
}
