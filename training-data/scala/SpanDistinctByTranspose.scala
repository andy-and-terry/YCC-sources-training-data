object SpanDistinctByTranspose {
  def main(args: Array[String]): Unit = {
    val nums = List(2, 4, 6, 7, 8, 10)
    val (evenPrefix, rest) = nums.span(_ % 2 == 0)
    println(s"$evenPrefix | $rest")
    println(nums.dropWhile(_ < 7))

    val words = List("apple", "avocado", "banana", "blueberry", "cherry")
    println(words.distinctBy(_.head))
    println(words.sortWith((a, b) => a.length > b.length || (a.length == b.length && a < b)))
    println(words.maxBy(_.length))
    println(words.minBy(_.length))

    val rows = List(List(1, 2, 3), List(4, 5, 6))
    println(rows.transpose)

    println(List(1, 2, 3).tails.toList)
    println(List(1, 2, 3).inits.toList)
    println(List(1, 2, 3, 4).combinations(2).toList)
  }
}
