object PigLatin {
  private val VowelStart = "^([aeiou]|xr|yt).*".r
  private val Consonant = "^([^aeiou]*qu|[^aeiou]+?(?=y)|[^aeiou]+)(.*)$".r

  def word(w: String): String = w match {
    case VowelStart(_) => w + "ay"
    case Consonant(head, tail) => tail + head + "ay"
    case _ => w + "ay"
  }

  def translate(s: String): String = s.toLowerCase.split("\\s+").map(word).mkString(" ")

  def main(args: Array[String]): Unit = println(translate("quick fast run apple rhythm square"))
}
