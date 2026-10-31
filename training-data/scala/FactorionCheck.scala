object FactorionCheck extends App {
  val fact = Array(1, 1, 2, 6, 24, 120, 720, 5040, 40320, 362880)

  def isFactorion(n: Int): Boolean = n == n.toString.map(c => fact(c - '0')).sum

  println((1 until 50000).filter(isFactorion))
}
