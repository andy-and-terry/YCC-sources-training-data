// Squarefree numbers up to 100; expect 61.
object SquarefreeNumbers extends App {
  def squarefree(n: Int): Boolean = (2 to math.sqrt(n).toInt).forall(d => n % (d * d) != 0)
  println((1 to 100).count(squarefree))
}
