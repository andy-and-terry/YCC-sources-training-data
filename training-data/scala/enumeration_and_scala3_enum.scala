object EnumerationAndScala3Enum {
  object Color extends Enumeration {
    val Red, Green, Blue = Value
  }

  sealed abstract class Level(val rank: Int)
  object Level {
    case object Low extends Level(1)
    case object High extends Level(3)
    val all = List(Low, High)
  }

  def main(args: Array[String]): Unit = {
    println(Color.values.toList + " " + Color.withName("Green").id)
    println(Level.all.map(l => s"${l} ${l.rank}"))
    println(Level.all.maxBy(_.rank))
  }
}
