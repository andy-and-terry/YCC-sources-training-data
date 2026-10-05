object VarArgsDemo {
  def sum(nums: Int*): Int = nums.sum

  def describe(label: String, items: Any*): String =
    s"$label(${items.mkString(", ")}) with ${items.length} items"

  def maxOf(first: Int, rest: Int*): Int = rest.foldLeft(first)(math.max)

  def main(args: Array[String]): Unit = {
    println(sum())
    println(sum(1, 2, 3))
    val xs = List(4, 5, 6)
    println(sum(xs: _*))
    println(describe("mixed", 1, "two", 3.0))
    println(maxOf(3, 9, 2))
    println(maxOf(7))
    println(List(1, 2, 3) ++ Seq(4, 5))
    val Seq(a, b, rest @ _*) = Seq(1, 2, 3, 4, 5)
    println(s"$a $b $rest")
    println(Array(1, 2, 3).toSeq match { case Seq(h, _*) => h })
  }
}
