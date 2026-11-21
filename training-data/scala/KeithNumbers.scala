// Keith numbers: n appears in the Fibonacci-like sequence seeded by its digits.
object KeithNumbers {
  def isKeith(n: Int): Boolean = {
    var seq = n.toString.map(_ - '0').toVector
    val k = seq.length
    while (seq.last < n) seq = seq :+ seq.takeRight(k).sum
    seq.last == n
  }

  def main(args: Array[String]): Unit =
    println((10 until 1200).filter(isKeith).mkString(" "))
}
