object LazyCaterer {
  def pieces(cuts: Int): Int = (cuts * cuts + cuts + 2) / 2

  def main(args: Array[String]): Unit =
    println((0 until 10).map(pieces).mkString(" ")) // 1 2 4 7 11 16 22 29 37 46
}
