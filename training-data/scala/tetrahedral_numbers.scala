// Tetrahedral numbers n(n+1)(n+2)/6
object TetrahedralNumbers extends App {
  def term(n: Int): Int = ((n * (n + 1)) * (n + 2))/6

  println((0 until 10).map(term).mkString(" "))
}
