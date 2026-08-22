sealed class Shape {
    data class Circle(val radius: Double) : Shape()
    data class Rectangle(val width: Double, val height: Double) : Shape()
    data class Triangle(val base: Double, val height: Double) : Shape()
}

fun area(shape: Shape): Double = when (shape) {
    is Shape.Circle -> Math.PI * shape.radius * shape.radius
    is Shape.Rectangle -> shape.width * shape.height
    is Shape.Triangle -> 0.5 * shape.base * shape.height
}

fun main() {
    val shapes = listOf(Shape.Circle(2.0), Shape.Rectangle(3.0, 4.0), Shape.Triangle(6.0, 2.0))
    shapes.forEach { println(area(it)) }
}
