object StringInterpolationDemo {
  def main(args: Array[String]): Unit = {
    val name = "Scala"
    val version = 3.4
    val items = List(1, 2, 3)
    println(s"Hello, $name! Sum=${items.sum}")
    println(f"Version: $version%.2f, padded: ${42}%05d")
    println(raw"No\nescape here: $name")
    println(s"${if (items.nonEmpty) "has" else "no"} items")
    val multi =
      """|line one
         |line two: $name""".stripMargin
    println(multi)
    println("%-6s|%6s|".format("ab", "cd"))
    println("a,b,,c".split(",").toList)
    println("hello".capitalize + " " + "WORLD".toLowerCase)
    println("abc".reverse + "x" * 3)
    println("racecar".sameElements("racecar".reverse))
  }
}
