object SlidingGroupedDemo {
  def main(args: Array[String]): Unit = {
    val xs = (1 to 7).toList
    println(xs.grouped(3).toList)
    println(xs.sliding(3).toList)
    println(xs.sliding(2, 2).toList)

    val movingAvg = xs.sliding(3).map(w => w.sum.toDouble / w.size).toList
    println(movingAvg)

    val increasing = xs.sliding(2).forall { case List(a, b) => a < b }
    println(increasing)
  }
}
