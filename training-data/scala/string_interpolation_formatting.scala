object StringInterpolationFormatting {
  def main(args: Array[String]): Unit = {
    val name = "Ada"; val pi = 3.14159; val n = 42
    println(s"Hi $name, ${n * 2} ${name.length}")
    println(f"$pi%.2f $n%05d $name%-6s| $n%x")
    println(raw"no\nescape $name")
    println("a,b;c".split("[,;]").toList + " " + "  trim  ".trim + "|" + "abc".capitalize + "x" * 3)
    println("hello world".split(' ').map(_.capitalize).mkString(" "))
    println("Scala".toList.reverse.mkString + "scala".charAt(2) + "scala".indexOf("la"))
    println("""|multi
               |line""".stripMargin)
    println("%s has %d".format("x", 3))
  }
}
