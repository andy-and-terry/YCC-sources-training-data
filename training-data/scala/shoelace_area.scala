object ShoelaceArea extends App {
  def area(p: Seq[(Double, Double)]): Double = {
    val next = p.tail :+ p.head
    math.abs(p.zip(next).map { case ((x1, y1), (x2, y2)) => x1 * y2 - x2 * y1 }.sum) / 2
  }

  println(area(Seq((0.0, 0.0), (4.0, 0.0), (4.0, 3.0), (0.0, 3.0))))
}
