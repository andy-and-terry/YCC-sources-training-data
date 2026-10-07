object SlidingScanDemo {
  def main(args: Array[String]): Unit = {
    val xs = List(3, 1, 4, 1, 5, 9, 2, 6)

    println(xs.sliding(3).toList)
    println(xs.sliding(3, 3).toList)
    println(xs.grouped(3).toList)

    val movingAvg = xs.sliding(3).map(w => w.sum.toDouble / w.size).toList
    println(movingAvg.map(a => f"$a%.2f"))

    println(xs.scanLeft(0)(_ + _))
    println(xs.scanLeft(Int.MinValue)(math.max).tail)

    println(xs.zipWithIndex.filter(_._2 % 2 == 0).map(_._1))
    println(xs.zip(xs.tail).map { case (a, b) => b - a })
    println(xs.lazyZip(xs.reverse).map(_ * _))

    println(xs.takeWhile(_ < 5))
    println(xs.dropWhile(_ < 5))
    println((xs.indexOf(5), xs.lastIndexOf(1)))
    println(xs.inits.toList.take(3))
    println(xs.tails.map(_.size).toList)
  }
}
