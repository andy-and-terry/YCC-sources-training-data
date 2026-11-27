object LahNumbers extends App {
  def fact(n: Int): BigInt = (1 to n).foldLeft(BigInt(1))(_ * _)
  def comb(n: Int, k: Int): BigInt = fact(n) / (fact(k) * fact(n - k))
  def lah(n: Int, k: Int): BigInt = comb(n - 1, k - 1) * fact(n) / fact(k)

  for (n <- 1 to 5) println((1 to n).map(lah(n, _)).mkString(" "))
}
