object RegexFindallReplace {
  def main(args: Array[String]): Unit = {
    val date = """(\d{4})-(\d{2})-(\d{2})""".r
    println(date.findFirstIn("on 2024-03-05 ok"))
    println(date.findAllMatchIn("2024-01-01 and 2025-12-31").map(_.group(1)).toList)
    println(date.replaceAllIn("2024-03-05", m => s"${m.group(3)}/${m.group(2)}/${m.group(1)}"))
    "2024-03-05" match { case date(y, m, d) => println(s"$y|$m|$d") }
    println("a1b22c".replaceAll("[0-9]+", "#") + " " + "one two".split("\\s+").length)
    println("(?i)hello".r.findFirstIn("Say HELLO"))
    val kv = """(\w+)=(\w+)""".r
    println(kv.findAllMatchIn("a=1 b=2").map(m => m.group(1) -> m.group(2)).toMap)
  }
}
