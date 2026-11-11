// Centered square numbers 2n(n+1)+1
object CenteredSquareNumbers extends App {
  def term(n: Int): Int = ((2 * n) * (n + 1)) + 1

  println((0 until 10).map(term).mkString(" "))
}
