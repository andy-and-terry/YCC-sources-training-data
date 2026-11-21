// Perfect totient numbers: sum of the iterated totient chain down to 1 equals n.
object PerfectTotientNumbers {
  def phi(n: Int): Int = (1 to n).count(k => BigInt(k).gcd(BigInt(n)) == 1)

  def isPerfectTotient(n: Int): Boolean = {
    var total = 0
    var m = n
    while (m > 1) { m = phi(m); total += m }
    total == n
  }

  def main(args: Array[String]): Unit =
    println((2 until 200).filter(isPerfectTotient).mkString(" "))
}
