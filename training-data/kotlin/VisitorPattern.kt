sealed interface Shape {
    fun <R> accept(visitor: ShapeVisitor<R>): R
}

class Circle(val radius: Double) : Shape {
    override fun <R> accept(visitor: ShapeVisitor<R>): R = visitor.visitCircle(this)
}

class Rectangle(val width: Double, val height: Double) : Shape {
    override fun <R> accept(visitor: ShapeVisitor<R>): R = visitor.visitRectangle(this)
}

interface ShapeVisitor<R> {
    fun visitCircle(circle: Circle): R
    fun visitRectangle(rectangle: Rectangle): R
}

class AreaVisitor : ShapeVisitor<Double> {
    override fun visitCircle(circle: Circle): Double = Math.PI * circle.radius * circle.radius
    override fun visitRectangle(rectangle: Rectangle): Double = rectangle.width * rectangle.height
}

class DescriptionVisitor : ShapeVisitor<String> {
    override fun visitCircle(circle: Circle): String = "circle(r=${circle.radius})"
    override fun visitRectangle(rectangle: Rectangle): String =
        "rectangle(${rectangle.width}x${rectangle.height})"
}

fun main() {
    val shapes: List<Shape> = listOf(Circle(2.0), Rectangle(3.0, 4.0))
    val areaVisitor = AreaVisitor()
    val descriptionVisitor = DescriptionVisitor()

    for (shape in shapes) {
        val description = shape.accept(descriptionVisitor)
        val area = shape.accept(areaVisitor)
        println("$description -> area=$area")
    }
}
