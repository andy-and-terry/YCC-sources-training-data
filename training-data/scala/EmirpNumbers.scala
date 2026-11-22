// Emirps: primes whose digit reversal is a different prime.
object EmirpNumbers {
  def isPrime(n: Int): Boolean = n >= 2 && (2 to math.sqrt(n).toInt).forall(n % _ != 0)

  def main(args: Array[String]): Unit = {
    val emirps = (2 until 200).filter { n =>
      val r = n.toString.reverse.toInt
      r != n && isPrime(n) && isPrime(r)
    }
    println(emirps.mkString(" "))
  }
}
