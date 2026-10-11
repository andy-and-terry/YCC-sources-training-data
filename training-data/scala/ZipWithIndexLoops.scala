object ZipWithIndexLoops {
  def main(args: Array[String]): Unit = {
    val items = List("red", "green", "blue")

    for ((item, i) <- items.zipWithIndex)
      println(s"$i -> $item")

    items.indices.foreach(i => print(s"[$i]"))
    println()

    println(items.zip(LazyList.from(10)))
    println(items.lazyZip(items.map(_.length)).map((s, n) => s"$s:$n"))
    println(items.zipAll(List(1, 2), "none", -1))
    val (names, nums) = items.zip(List(1, 2, 3)).unzip
    println(names)
    println(nums)
  }
}
