// Lazy caterer sequence: max pieces from n cuts
object LazyCaterer extends App {
  def term(n: Int): Int = ((n * (n + 1))/2) + 1

  println((0 until 10).map(term).mkString(" "))
}
