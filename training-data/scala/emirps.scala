// Emirps below 200; expect 15.
object Emirps extends App {
  def isPrime(n: Int): Boolean = n > 1 && (2 to math.sqrt(n).toInt).forall(n % _ != 0)
  def rev(n: Int): Int = n.toString.reverse.toInt
  val found = (2 until 200).filter(n => rev(n) != n && isPrime(n) && isPrime(rev(n)))
  println(s"${found.size} $found")
}
