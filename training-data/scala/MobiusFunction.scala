// Moebius function: 0 if n has a squared prime factor, else (-1)^k.
object MobiusFunction {
  def mobius(start: Int): Int = {
    var n = start
    var result = 1
    var p = 2
    while (p * p <= n) {
      if (n % p == 0) {
        n /= p
        if (n % p == 0) return 0
        result = -result
      }
      p += 1
    }
    if (n > 1) -result else result
  }

  def main(args: Array[String]): Unit =
    println((1 to 30).map(mobius).mkString(" "))
}
