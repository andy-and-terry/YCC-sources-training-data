interface Shape {
    fun area(): Double
}

class Circle(private val radius: Double) : Shape {
    override fun area(): Double = Math.PI * radius * radius
}

class Square(private val side: Double) : Shape {
    override fun area(): Double = side * side
}

object ShapeFactory {
    fun create(kind: String, size: Double): Shape = when (kind) {
        "circle" -> Circle(size)
        "square" -> Square(size)
        else -> throw IllegalArgumentException("unknown shape: $kind")
    }
}

fun main() {
    val circle = ShapeFactory.create("circle", 2.0)
    val square = ShapeFactory.create("square", 3.0)
    println(circle.area())
    println(square.area())
}
