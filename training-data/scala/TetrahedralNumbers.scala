// Tetrahedral numbers: n(n+1)(n+2)/6.
object TetrahedralNumbers {
  def main(args: Array[String]): Unit =
    println((1 to 10).map(n => n * (n + 1) * (n + 2) / 6).mkString(" "))
}
