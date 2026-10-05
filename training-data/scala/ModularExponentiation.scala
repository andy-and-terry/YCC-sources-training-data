import scala.annotation.tailrec

object ModularExponentiation {
  @tailrec
  def modPow(base: Long, exp: Long, mod: Long, acc: Long = 1L): Long =
    if (exp == 0) acc
    else if ((exp & 1L) == 1L) modPow(base * base % mod, exp >> 1, mod, acc * base % mod)
    else modPow(base * base % mod, exp >> 1, mod, acc)

  def main(args: Array[String]): Unit = {
    println(modPow(2, 10, 1000))
    println(modPow(3, 200, 13))
    val p = 1000000007L
    val inv = modPow(7, p - 2, p)
    println(s"$inv ${7 * inv % p}")
    println(BigInt(3).modPow(200, 13))
  }
}
