object BinaryGap {
  def gap(n: Int): Int = {
    val trimmed = n.toBinaryString.reverse.dropWhile(_ == '0').reverse
    trimmed.split('1').map(_.length).maxOption.getOrElse(0)
  }

  def main(args: Array[String]): Unit =
    Seq(9, 529, 20, 15, 1041).foreach(n => println(s"$n ${n.toBinaryString} ${gap(n)}"))
}
