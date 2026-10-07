object RegexExtractorDemo {
  val Date = """(\d{4})-(\d{2})-(\d{2})""".r
  val Email = """([\w.]+)@([\w.]+)""".r

  def classify(s: String): String = s match {
    case Date(y, m, d)  => s"date: day=$d month=$m year=$y"
    case Email(user, h) => s"email: user=$user host=$h"
    case _              => "unknown"
  }

  def main(args: Array[String]): Unit = {
    List("2024-03-15", "ann@example.org", "hello").foreach(s => println(classify(s)))

    val text = "call 555-1234 or 555-9876 today"
    val phone = """\d{3}-\d{4}""".r
    println(phone.findAllIn(text).toList)
    println(phone.findFirstIn(text))
    println(phone.replaceAllIn(text, "XXX-XXXX"))
    println(phone.replaceAllIn(text, m => m.matched.reverse))

    val kv = """(\w+)=(\w+)""".r
    val pairs = kv.findAllMatchIn("a=1, b=2, c=3").map(m => m.group(1) -> m.group(2)).toMap
    println(pairs)
    println("a1b2c3".split("\\d").toList)
    println("x".matches("[a-z]"))
  }
}
