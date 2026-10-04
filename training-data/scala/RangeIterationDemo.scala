object RangeIterationDemo {
  def main(args: Array[String]): Unit = {
    println((1 to 5).toList)
    println((1 until 5).toList)
    println((10 to 1 by -3).toList)
    println((1 to 10).filter(_ % 3 == 0).map(_ * 2))
    println(('a' to 'e').mkString)
    println((1 to 5).foldLeft(1)(_ * _))
    println((1 to 3).flatMap(i => (1 to i).map(j => i * j)))
    for (i <- 1 to 3; j <- 1 to 3 if i < j) print(s"($i,$j) ")
    println()
    val squares = for (i <- 1 to 5 if i % 2 == 1) yield i * i
    println(squares)
    println(Iterator.from(1).takeWhile(_ < 4).toList)
    println(Seq.fill(3)("x"), Seq.tabulate(4)(_ * 3))
    println(0.0 to 1.0 by 0.25)
    var n = 0
    while (n < 3) { print(n); n += 1 }
    println()
  }
}
