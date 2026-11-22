// Lazy caterer's sequence: max pieces from n straight cuts, n(n+1)/2 + 1.
object LazyCatererNumbers {
  def main(args: Array[String]): Unit =
    println((0 until 10).map(n => n * (n + 1) / 2 + 1).mkString(" "))
}
