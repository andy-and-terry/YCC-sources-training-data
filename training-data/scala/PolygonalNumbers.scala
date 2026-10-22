object PolygonalNumbers {
  def polygonal(sides: Int, n: Int): Int =
    ((sides - 2) * n * n - (sides - 4) * n) / 2

  def main(args: Array[String]): Unit = {
    val shapes = List("Triangular" -> 3, "Pentagonal" -> 5, "Hexagonal" -> 6)
    for ((name, sides) <- shapes)
      println(s"$name: " + (1 to 10).map(polygonal(sides, _)).mkString(" "))
  }
}
