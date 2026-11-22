// Cake numbers: max pieces from n plane cuts of a cube, (n^3 + 5n + 6) / 6.
object CakeNumbers {
  def main(args: Array[String]): Unit =
    println((0 until 10).map(n => (n * n * n + 5 * n + 6) / 6).mkString(" "))
}
