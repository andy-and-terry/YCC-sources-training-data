// Shoelace polygon area with a case class.
object ShoelacePolygonArea {
  case class Point(x: Double, y: Double)
  def area(p: Vector[Point]): Double =
    math.abs(p.indices.map { i => val q = p((i + 1) % p.size); p(i).x * q.y - q.x * p(i).y }.sum) / 2
  def main(args: Array[String]): Unit =
    println(area(Vector(Point(0, 0), Point(4, 0), Point(4, 3), Point(0, 3))))
}
