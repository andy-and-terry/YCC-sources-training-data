// Carmichael numbers: composite n where a^(n-1) = 1 (mod n) for all a coprime to n.
object CarmichaelNumbers {
  def isPrime(n: Int): Boolean = n > 1 && (2 to math.sqrt(n).toInt).forall(n % _ != 0)

  def isCarmichael(n: Int): Boolean =
    !isPrime(n) && (2 until n).forall { a =>
      BigInt(a).gcd(BigInt(n)) != 1 || BigInt(a).modPow(n - 1, n) == 1
    }

  def main(args: Array[String]): Unit =
    println((3 until 3000 by 2).filter(isCarmichael).mkString(" "))
}
