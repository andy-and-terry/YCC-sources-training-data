object HammingWeight extends App {
  @annotation.tailrec
  def popcount(n: Long, acc: Int = 0): Int = if (n == 0) acc else popcount(n & (n - 1), acc + 1)
  println(s"${popcount(0xB7)} ${java.lang.Long.bitCount(0xB7)}")
}
