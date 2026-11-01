// Evil numbers have an even number of 1 bits.
object EvilNumbers {
  def main(args: Array[String]): Unit =
    println((0 to 20).filter(n => Integer.bitCount(n) % 2 == 0).mkString(" "))
}
