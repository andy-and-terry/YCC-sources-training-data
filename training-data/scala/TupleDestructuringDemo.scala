object TupleDestructuringDemo {
  def minMax(xs: List[Int]): (Int, Int) = (xs.min, xs.max)

  def main(args: Array[String]): Unit = {
    val (lo, hi) = minMax(List(4, 2, 9, 7))
    println(s"lo=$lo hi=$hi")
    val (a, b, c) = (1, "two", 3.0)
    println(s"$a $b $c")
    val pair = ("k", 5)
    println(pair._1 + pair._2)
    println(pair.swap)
    val List(first, second, _*) = List(10, 20, 30, 40)
    println(first + second)
    val Array(x, y) = "3,4".split(",").map(_.toInt)
    println(x * y)
    val pairs = List(("a", 1), ("b", 2))
    println(pairs.map { case (k, v) => s"$k=$v" }.mkString("&"))
    println(pairs.unzip)
    println(List(1, 2).zip(List("x", "y")).toMap)
    val head :: tail = List(1, 2, 3)
    println(s"$head $tail")
  }
}
