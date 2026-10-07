object RegexPatternMatchDemo {
  val Date = """(\d{4})-(\d{2})-(\d{2})""".r
  val Email = """([\w.]+)@([\w.]+)""".r
  val Number = """(-?\d+)""".r

  def classify(s: String): String = s match {
    case Date(y, m, d) => s"date year=$y month=$m day=$d"
    case Email(user, domain) => s"email user=$user domain=$domain"
    case Number(n) => s"number ${n.toInt * 2}"
    case _ => "unknown"
  }

  def main(args: Array[String]): Unit = {
    List("2024-03-15", "ann@example.com", "-42", "???").foreach(s => println(classify(s)))

    val words = """\w+""".r
    println(words.findAllIn("the quick brown fox").toList)
    println(Number.findFirstIn("abc 123 def 456"))
    println(Number.replaceAllIn("a1 b22", m => (m.group(1).toInt + 1).toString))
    println("a1b2c3".replaceAll("[0-9]", "#"))

    val kv = """(\w+)=(\w+)""".r
    val pairs = kv.findAllMatchIn("a=1, b=2, c=3").map(m => m.group(1) -> m.group(2)).toMap
    println(pairs)

    val Date(year, _, _) = "1999-12-31"
    println(year)
    println("hello world".matches("hello.*"))
    println("x,y;z".split("[,;]").toList)
  }
}
