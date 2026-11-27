object EmirpPrimes extends App {
  def isPrime(n: Int): Boolean = n >= 2 && (2 to math.sqrt(n).toInt).forall(n % _ != 0)
  def rev(n: Int): Int = n.toString.reverse.toInt

  println((2 until 100).filter(p => isPrime(p) && rev(p) != p && isPrime(rev(p))))
}
