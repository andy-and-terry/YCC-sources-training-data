object SlidingGroupedDemo {
  def main(args: Array[String]): Unit = {
    val data = List(1, 4, 2, 8, 5, 7)

    println(data.sliding(2).map(w => w(1) - w.head).toList)
    println(data.sliding(3).map(w => w.sum / 3.0).toList)
    println(data.grouped(4).toList)
    println(data.sliding(3, 2).toList)
    println(data.zip(data.tail).count { case (a, b) => a < b })
    println(data.scanLeft(0)(_ + _))
    println((data.takeWhile(_ < 8), data.dropWhile(_ < 8)))
    println(data.span(_ < 5))
    println(data.zipWithIndex.filter(_._2 % 2 == 0).map(_._1))
    println((data.indices.toList, data.lastIndexWhere(_ > 4)))
    println(data.inits.toList.take(3))
    println(data.tails.map(_.headOption).toList)
  }
}
