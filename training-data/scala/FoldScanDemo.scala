object FoldScanDemo {
  def main(args: Array[String]): Unit = {
    val xs = List(1, 2, 3, 4, 5)
    println(xs.scanLeft(0)(_ + _))
    println(xs.scanRight(0)(_ + _))
    println(xs.foldLeft("")((acc, x) => acc + x))
    println(xs.reduceLeft(_ - _))
    println(xs.reduceRight(_ - _))
    println(xs.sliding(2).map(_.sum).toList)
    println(xs.grouped(2).toList)
    println(xs.zipWithIndex.map { case (x, i) => x * i })
    println(xs.takeWhile(_ < 4) ++ xs.dropWhile(_ < 4))
    println(xs.tails.toList)
    println(xs.combinations(2).size)
    println(xs.flatMap(x => List(x, -x)).take(4))
    println(xs.foldLeft((0, 1)) { case ((s, p), x) => (s + x, p * x) })
  }
}
