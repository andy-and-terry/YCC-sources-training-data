object EmirpNumbers extends App {
  def isPrime(n: Int): Boolean = n >= 2 && (2 to math.sqrt(n).toInt).forall(n % _ != 0)
  def reverse(n: Int): Int = n.toString.reverse.toInt

  val emirps = (2 until 200).filter(p => reverse(p) != p && isPrime(p) && isPrime(reverse(p)))
  println(emirps.toList) // List(13, 17, 31, 37, 71, 73, 79, 97, 107, 113, 149, 157, 167, 179, 199)
}
