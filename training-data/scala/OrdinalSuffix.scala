object OrdinalSuffix extends App {
  def ordinal(n: Int): String = {
    val suffix = (n % 100, n % 10) match {
      case (11 | 12 | 13, _) => "th"
      case (_, 1) => "st"
      case (_, 2) => "nd"
      case (_, 3) => "rd"
      case _ => "th"
    }
    s"$n$suffix"
  }
  println(List(1, 2, 3, 4, 11, 12, 13, 21, 101, 111).map(ordinal).mkString(" "))
}
