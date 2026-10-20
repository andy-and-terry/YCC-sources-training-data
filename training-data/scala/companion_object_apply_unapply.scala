class Email private (val user: String, val domain: String) {
  override def toString = s"$user@$domain"
}

object Email {
  def apply(s: String): Option[Email] = s.split("@") match {
    case Array(u, d) if u.nonEmpty && d.contains(".") => Some(new Email(u, d))
    case _ => None
  }
  def unapply(e: Email): Option[(String, String)] = Some((e.user, e.domain))
}

object Even { def unapply(n: Int): Boolean = n % 2 == 0 }

object CompanionObjectApplyUnapply {
  def main(args: Array[String]): Unit = {
    println(Email("a@b.com"), Email("bad"))
    Email("ada@math.org").foreach { case Email(u, d) => println(s"$u at $d") }
    for (n <- List(1, 2, 3)) n match { case Even() => println(s"$n even"); case _ => println(s"$n odd") }
    val re = """(\d+)-(\d+)""".r
    "10-20" match { case re(a, b) => println(a.toInt + b.toInt); case _ => () }
  }
}
