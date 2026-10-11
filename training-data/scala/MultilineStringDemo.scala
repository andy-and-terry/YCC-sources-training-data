object MultilineStringDemo {
  def main(args: Array[String]): Unit = {
    val poem =
      """Roses are red,
        |Violets are blue,
        |Scala has margins,
        |    and so can you.""".stripMargin
    println(poem)

    val lines = poem.linesIterator.toList
    println(lines.size)
    println(lines.map(_.trim).map(_.length))

    val json =
      s"""{
         |  "count": ${lines.size},
         |  "first": "${lines.head}"
         |}""".stripMargin
    println(json)
    println("""C:\path\no\escapes""")
  }
}
