object Email {
  def unapply(str: String): Option[(String, String)] = {
    val parts = str.split("@")
    if (parts.length == 2) Some((parts(0), parts(1))) else None
  }
}

object PhoneNumber {
  private val pattern = """(\d{3})-(\d{3})-(\d{4})""".r

  def unapply(str: String): Option[(String, String, String)] = str match {
    case pattern(area, exchange, line) => Some((area, exchange, line))
    case _                             => None
  }
}

object ExtractorPatternDemo {
  def describe(input: String): String = input match {
    case Email(user, domain)               => s"email: user=$user domain=$domain"
    case PhoneNumber(area, exchange, line) => s"phone: ($area) $exchange-$line"
    case _                                 => "unrecognized"
  }

  def main(args: Array[String]): Unit = {
    List("alice@example.com", "555-123-4567", "not a match").foreach { s =>
      println(describe(s))
    }
  }
}
