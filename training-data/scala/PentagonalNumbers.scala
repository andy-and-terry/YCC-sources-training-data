// Pentagonal numbers: n(3n-1)/2.
object PentagonalNumbers {
  def main(args: Array[String]): Unit =
    println((1 to 10).map(n => n * (3 * n - 1) / 2).mkString(" "))
}
