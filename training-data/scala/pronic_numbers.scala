// Pronic numbers n(n+1)
object PronicNumbers extends App {
  def term(n: Int): Int = n * (n + 1)

  println((0 until 10).map(term).mkString(" "))
}
