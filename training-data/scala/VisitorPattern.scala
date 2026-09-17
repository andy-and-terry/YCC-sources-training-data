sealed trait Shape {
  def accept[R](visitor: ShapeVisitor[R]): R
}

case class Circle(radius: Double) extends Shape {
  def accept[R](visitor: ShapeVisitor[R]): R = visitor.visitCircle(this)
}

case class Rectangle(width: Double, height: Double) extends Shape {
  def accept[R](visitor: ShapeVisitor[R]): R = visitor.visitRectangle(this)
}

trait ShapeVisitor[R] {
  def visitCircle(c: Circle): R
  def visitRectangle(r: Rectangle): R
}

class AreaVisitor extends ShapeVisitor[Double] {
  def visitCircle(c: Circle): Double = math.Pi * c.radius * c.radius
  def visitRectangle(r: Rectangle): Double = r.width * r.height
}

class DescriptionVisitor extends ShapeVisitor[String] {
  def visitCircle(c: Circle): String = s"circle(r=${c.radius})"
  def visitRectangle(r: Rectangle): String = s"rectangle(${r.width}x${r.height})"
}

object VisitorPattern {
  def main(args: Array[String]): Unit = {
    val shapes: List[Shape] = List(Circle(2.0), Rectangle(3.0, 4.0))
    val areaVisitor = new AreaVisitor
    val descVisitor = new DescriptionVisitor

    for (shape <- shapes) {
      println(s"${shape.accept(descVisitor)} -> area ${shape.accept(areaVisitor)}")
    }
  }
}
