object ZipUnzipDemo {
  def main(args: Array[String]): Unit = {
    val names = List("a", "b", "c")
    val nums = List(1, 2, 3, 4)
    println(names.zip(nums))
    println(names.zipAll(nums, "?", 0))
    println(names.zipWithIndex)

    val (ls, ns) = names.zip(nums).unzip
    println(s"$ls $ns")

    val dot = List(1, 2, 3).zip(List(4, 5, 6)).map { case (x, y) => x * y }.sum
    println(s"dot product = $dot")
    println(nums.lazyZip(names).map((n, s) => s * n))
  }
}
