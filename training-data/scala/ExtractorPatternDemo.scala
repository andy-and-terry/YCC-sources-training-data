object Email {
  def unapply(str: String): Option[(String, String)] = {
    val parts = str.split("@")
    if (parts.length == 2) Some((parts(0), parts(1))) else None
  }
}

object Phone {
  def unapply(str: String): Boolean = str.matches("\\d{3}-\\d{4}")
}

class Fraction(val numerator: Int, val denominator: Int)

object Fraction {
  def apply(n: Int, d: Int): Fraction = new Fraction(n, d)
  def unapply(f: Fraction): Option[(Int, Int)] = Some((f.numerator, f.denominator))
}

object ExtractorPatternDemo {
  def classify(input: String): String = input match {
    case Email(user, domain) => s"email: user=$user domain=$domain"
    case Phone() => "phone number"
    case _ => "unknown"
  }

  def main(args: Array[String]): Unit = {
    List("alice@example.com", "555-1234", "not-a-match").foreach { s =>
      println(s"$s -> ${classify(s)}")
    }

    val half = Fraction(1, 2)
    half match {
      case Fraction(n, d) => println(s"fraction: $n/$d")
    }
  }
}
