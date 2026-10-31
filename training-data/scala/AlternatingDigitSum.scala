object AlternatingDigitSum extends App {
  def alternatingDigitSum(n: Int): Int =
    n.toString.reverse.zipWithIndex.map { case (c, i) =>
      val d = c - '0'
      if (i % 2 == 0) d else -d
    }.sum

  List(1234, 99999, 1000).foreach(n => println(s"$n ${alternatingDigitSum(n)}"))
}
