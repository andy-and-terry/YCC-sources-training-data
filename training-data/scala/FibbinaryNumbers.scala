// Fibbinary numbers: no two adjacent 1 bits.
object FibbinaryNumbers {
  def main(args: Array[String]): Unit =
    println((0 until 50).filter(n => (n & (n >> 1)) == 0).mkString(" "))
}
