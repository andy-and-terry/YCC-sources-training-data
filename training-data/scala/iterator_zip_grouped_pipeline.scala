object IteratorZipGroupedPipeline {
  def main(args: Array[String]): Unit = {
    val it = Iterator.from(1).map(_ * 3).filter(_ % 2 == 1)
    println(it.take(4).toList)
    val lines = Iterator("a=1", "b=2", "", "c=3")
    println(lines.filter(_.nonEmpty).map(_.split("=")).map(a => a(0) -> a(1).toInt).toMap)
    val it2 = List(1, 2, 3, 4, 5).iterator
    println(it2.grouped(2).toList)
    println(Iterator.continually(7).take(3).sum)
    val (a, b) = Iterator.range(0, 6).duplicate
    println(a.sum + " " + b.max)
    println(Iterator("x", "y").zipWithIndex.toList + " " + Iterator(1, 2, 3).sliding(2).toList)
  }
}
