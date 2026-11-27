object ShoelacePolygonArea extends App {
  def area(p: Seq[(Double, Double)]): Double = {
    val s = p.zip(p.tail :+ p.head).map { case ((x1, y1), (x2, y2)) => x1 * y2 - x2 * y1 }.sum
    math.abs(s) / 2
  }

  println(area(Seq((0.0, 0.0), (4.0, 0.0), (4.0, 3.0), (0.0, 3.0))))
}
