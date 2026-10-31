object SphenicNumbers extends App {
  def factorize(n: Int, p: Int = 2): List[Int] =
    if (n == 1) Nil
    else if (p * p > n) List(n)
    else if (n % p == 0) p :: factorize(n / p, p)
    else factorize(n, p + 1)

  def isSphenic(n: Int): Boolean = {
    val fs = factorize(n)
    fs.size == 3 && fs.distinct.size == 3
  }

  println((2 until 80).filter(isSphenic))
}
