// Emirps: primes whose digit reversal is a different prime.
def isPrime(n: Int): Boolean =
  n >= 2 && (2 to math.sqrt(n).toInt).forall(n % _ != 0)

def reverse(n: Int): Int = n.toString.reverse.toInt

@main def emirpNumbers(): Unit =
  val emirps = (2 until 100).filter(n => reverse(n) != n && isPrime(n) && isPrime(reverse(n)))
  println(emirps.mkString(" "))
