object Suit extends Enumeration {
  type Suit = Value
  val Hearts, Spades, Clubs, Diamonds = Value

  def color(s: Suit): String = s match {
    case Hearts | Diamonds => "red"
    case Spades | Clubs => "black"
  }
}

object EnumDemo {
  def main(args: Array[String]): Unit = {
    Suit.values.foreach(s => println(s"$s: ${Suit.color(s)}"))
  }
}
