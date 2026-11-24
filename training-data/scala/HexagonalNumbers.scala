// Hexagonal numbers: n(2n-1).
object HexagonalNumbers {
  def main(args: Array[String]): Unit =
    println((1 to 10).map(n => n * (2 * n - 1)).mkString(" "))
}
