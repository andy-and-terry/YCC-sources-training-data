object GroupByPartitionDemo {
  def main(args: Array[String]): Unit = {
    val words = List("apple", "avocado", "banana", "blueberry", "cherry")
    val byFirst = words.groupBy(_.head).toList.sortBy(_._1)
    byFirst.foreach { case (c, ws) => println(s"$c: ${ws.mkString(", ")}") }

    println(words.groupMapReduce(_.length)(_ => 1)(_ + _).toList.sorted)
    println(words.partition(_.length > 6))
    println(words.span(_.length > 5))
    println(words.takeWhile(_ != "banana"))
    println(words.dropWhile(_ != "banana"))
  }
}
