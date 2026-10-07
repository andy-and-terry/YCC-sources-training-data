object VarargsDemo {
  def sum(xs: Int*): Int = xs.foldLeft(0)(_ + _)

  def describe(label: String, xs: Any*): String =
    s"$label(${xs.mkString(", ")}) has ${xs.length} items"

  def main(args: Array[String]): Unit = {
    println(sum())
    println(sum(1, 2, 3))
    val nums = List(10, 20, 30)
    println(sum(nums: _*))
    println(describe("args", 1, "two", 3.0))
  }
}
