object PalindromicPrimes extends App {
  def isPrime(n: Int): Boolean = n >= 2 && (2 to math.sqrt(n).toInt).forall(n % _ != 0)
  def isPalindrome(n: Int): Boolean = n.toString == n.toString.reverse

  println((2 until 200).filter(n => isPalindrome(n) && isPrime(n)).toList)
  // List(2, 3, 5, 7, 11, 101, 131, 151, 181, 191)
}
