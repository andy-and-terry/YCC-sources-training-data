class Point private (val x: Double, val y: Double) {
  def +(other: Point): Point = Point(x + other.x, y + other.y)
  override def toString: String = s"($x, $y)"
}

object Point {
  def apply(x: Double, y: Double): Point = new Point(x, y)
}

object CompanionObjectDemo {
  def main(args: Array[String]): Unit = {
    val p1 = Point(1.0, 2.0)
    val p2 = Point(3.0, 4.0)
    println(p1 + p2)
  }
}
