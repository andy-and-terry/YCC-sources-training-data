object PowerfulNumbers extends App {
  def factorize(n: Int, p: Int = 2): List[Int] =
    if (n == 1) Nil
    else if (p * p > n) List(n)
    else if (n % p == 0) p :: factorize(n / p, p)
    else factorize(n, p + 1)

  def isPowerful(n: Int): Boolean =
    factorize(n).groupBy(identity).values.forall(_.size >= 2)

  println((1 to 100).filter(isPowerful).mkString(" "))
}
