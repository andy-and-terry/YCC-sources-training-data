object TupleDestructuringDemo {
  def minMax(xs: List[Int]): (Int, Int) = (xs.min, xs.max)

  def main(args: Array[String]): Unit = {
    val (lo, hi) = minMax(List(4, 9, 1, 7))
    println(s"min=$lo max=$hi")

    val pairs = List(("a", 1), ("b", 2), ("c", 3))
    for ((k, v) <- pairs) println(s"$k -> $v")

    val (evens, odds) = (1 to 10).partition(_ % 2 == 0)
    println(evens.mkString(",") + " | " + odds.mkString(","))

    val swapped = pairs.map(_.swap)
    println(swapped)
  }
}
