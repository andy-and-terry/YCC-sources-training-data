// Centered square numbers: n^2 + (n+1)^2.
object CenteredSquareNumbers {
  def main(args: Array[String]): Unit =
    println((0 until 10).map(n => n * n + (n + 1) * (n + 1)).mkString(" "))
}
