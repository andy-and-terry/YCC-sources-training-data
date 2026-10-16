object TupleSwapZipDemo {
  def minMax(xs: List[Int]): (Int, Int) = (xs.min, xs.max)

  def main(args: Array[String]): Unit = {
    val t = ("apple", 3, 1.5)
    println(t._1 + " " + t._2 + " " + t._3)
    val (a, b) = (1, 2)
    println((b, a))
    println(("k", "v").swap)

    val (lo, hi) = minMax(List(4, 9, -2, 7))
    println(s"lo=$lo hi=$hi")

    val pairs = List((1, "one"), (2, "two"), (3, "three"))
    println(pairs.map(_._2))
    println(pairs.toMap.get(2))
    println(pairs.map { case (n, s) => s"$n=$s" }.mkString(";"))
    println((1, 2) == (1, 2))
    println(Tuple2(1, "x").productArity)
  }
}
