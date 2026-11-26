// Palindromic primes below 200; expect 10.
object PalindromicPrimes extends App {
  def isPrime(n: Int): Boolean = n > 1 && (2 to math.sqrt(n).toInt).forall(n % _ != 0)
  val found = (2 until 200).filter(n => n.toString == n.toString.reverse && isPrime(n))
  println(found.mkString(" "))
  println(found.size)
}
