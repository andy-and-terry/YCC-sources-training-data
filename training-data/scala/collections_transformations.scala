object CollectionsTransformations {
  def main(args: Array[String]): Unit = {
    val xs = (1 to 10).toList
    println(xs.partition(_ % 2 == 0))
    println(xs.groupBy(_ % 3).view.mapValues(_.sum).toMap)
    println(xs.sliding(3).map(_.sum).toList)
    println(xs.grouped(4).toList)
    println(xs.foldLeft("")((acc, x) => acc + x))
    println(xs.scanLeft(0)(_ + _))
    println(xs.zip(xs.tail).map { case (a, b) => b - a }.distinct)
    println(xs.span(_ < 4))
    println(xs.takeWhile(_ < 4) ++ xs.dropWhile(_ < 9))
    println(List("b", "a", "c").sortBy(identity).reverse.mkString("-"))
    println(xs.find(_ > 7), xs.exists(_ > 10), xs.count(_ % 2 == 1), xs.indexOf(5))
    println(List(List(1), List(2, 3)).flatMap(identity), List(1, 2, 3).reduceLeft(_ - _))
  }
}
