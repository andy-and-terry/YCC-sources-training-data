object Email {
  def unapply(str: String): Option[(String, String)] = {
    val parts = str.split("@")
    if (parts.length == 2) Some((parts(0), parts(1))) else None
  }
}

object Even {
  def unapply(n: Int): Boolean = n % 2 == 0
}

object ExtractorDemo {
  def describe(input: String): String = input match {
    case Email(user, domain) => s"email for $user at $domain"
    case other => s"not an email: $other"
  }

  def parity(n: Int): String = n match {
    case Even() => s"$n is even"
    case _ => s"$n is odd"
  }

  def main(args: Array[String]): Unit = {
    println(describe("alice@example.com"))
    println(describe("not-an-email"))
    println(parity(4))
    println(parity(7))
  }
}
