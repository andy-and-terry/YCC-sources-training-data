object ChebyshevDistance extends App {
  def chebyshev(a: Seq[Int], b: Seq[Int]): Int = a.zip(b).map { case (x, y) => math.abs(x - y) }.max
  println(chebyshev(Seq(1, 2), Seq(4, 6)))
}
