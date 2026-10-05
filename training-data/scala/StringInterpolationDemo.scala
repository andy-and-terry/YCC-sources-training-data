object StringInterpolationDemo {
  case class Point(x: Int, y: Int)

  def main(args: Array[String]): Unit = {
    val name = "Scala"
    val version = 2.13
    val p = Point(3, 4)

    println(s"Hello, $name! Sum is ${1 + 2}")
    println(s"Point: $p, x=${p.x}")
    println(f"Version: $version%.1f, padded: ${42}%05d, hex: ${255}%x")
    println(f"${"left"}%-8s|${"right"}%8s|")
    println(raw"No\nescape here: $name")
    println(s"""Multi-line
               |  with margin $name
               |done""".stripMargin)

    implicit class JsonHelper(val sc: StringContext) {
      def json(args: Any*): String = {
        val parts = sc.parts.iterator
        val vals = args.iterator
        val sb = new StringBuilder(parts.next())
        while (vals.hasNext) {
          sb.append("\"").append(vals.next()).append("\"").append(parts.next())
        }
        sb.toString
      }
    }
    println(json"""{"name": $name, "lang": ${"jvm"}}""")
  }
}
