object FormattedOutputDemo {
  def main(args: Array[String]): Unit = {
    val name = "Widget"
    val price = 12.5
    val qty = 3
    println(f"$name%-10s|$price%8.2f|$qty%03d")
    println("%5d|%-5d|%05d".format(42, 42, 42))
    println(f"${price * qty}%.1f total")
    println("%x %X %o %b".format(255, 255, 8, true))
    println("%e".format(12345.678))
    println("%10s|".format("right"))
    println(f"${"pct"}%s ${0.256 * 100}%.1f%%")
    println(s"${qty + 1} items, escaped \$ sign")
    println(raw"no\nescape")
  }
}
