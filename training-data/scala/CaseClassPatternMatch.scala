sealed trait Shape
case class Circle(radius: Double) extends Shape
case class Rectangle(width: Double, height: Double) extends Shape
case class Triangle(base: Double, height: Double) extends Shape

object CaseClassPatternMatch {
  def area(shape: Shape): Double = shape match {
    case Circle(r) => math.Pi * r * r
    case Rectangle(w, h) => w * h
    case Triangle(b, h) => 0.5 * b * h
  }

  def main(args: Array[String]): Unit = {
    val shapes = List(Circle(2), Rectangle(3, 4), Triangle(6, 2))
    shapes.foreach(s => println(area(s)))
  }
}
