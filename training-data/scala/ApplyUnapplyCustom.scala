object ApplyUnapplyCustom {
  class Email private (val user: String, val domain: String) {
    override def toString = s"$user@$domain"
  }

  object Email {
    def apply(user: String, domain: String): Email = new Email(user.toLowerCase, domain.toLowerCase)
    def unapply(e: Email): Option[(String, String)] = Some((e.user, e.domain))
    def parse(s: String): Option[Email] = s.split("@") match {
      case Array(u, d) if u.nonEmpty && d.contains('.') => Some(Email(u, d))
      case _ => None
    }
  }

  def main(args: Array[String]): Unit = {
    val e = Email("Alice", "Example.COM")
    println(e)
    e match {
      case Email(u, d) => println(s"user=$u domain=$d")
    }
    println(Email.parse("bob@site.org"))
    println(Email.parse("broken"))
  }
}
