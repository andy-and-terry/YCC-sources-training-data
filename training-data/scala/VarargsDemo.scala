object VarargsDemo {
  def sum(nums: Int*): Int = nums.sum

  def describe(label: String, values: Any*): String =
    s"$label: ${values.mkString("[", ", ", "]")} (${values.length} items)"

  def maxOf(first: Int, rest: Int*): Int = rest.foldLeft(first)(math.max)

  def joinAll(sep: String)(parts: String*): String = parts.mkString(sep)

  def main(args: Array[String]): Unit = {
    println(sum())
    println(sum(1, 2, 3))

    val numbers = List(4, 5, 6)
    println(sum(numbers: _*))
    println(sum(Array(10, 20): _*))

    println(describe("mixed", 1, "two", 3.0))
    println(describe("none"))

    println(maxOf(3))
    println(maxOf(3, 9, 4))

    println(joinAll("-")("a", "b", "c"))

    def printAll(xs: Int*): Unit = xs match {
      case Seq() => println("empty")
      case Seq(x) => println(s"one: $x")
      case Seq(x, rest @ _*) => println(s"first=$x, rest=$rest")
    }
    printAll()
    printAll(1)
    printAll(1, 2, 3)
  }
}
