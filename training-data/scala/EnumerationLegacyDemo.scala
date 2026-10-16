object EnumerationLegacyDemo {
  object Weekday extends Enumeration {
    type Weekday = Value
    val Mon, Tue, Wed, Thu, Fri = Value
    val Sat = Value(10, "Saturday")
  }

  import Weekday._

  def isWork(d: Weekday): Boolean = d != Sat

  def main(args: Array[String]): Unit = {
    println(Weekday.values)
    println(Tue.id)
    println(Sat.id + " " + Sat)
    println(Weekday.withName("Wed"))
    println(Weekday(0))
    println(Weekday.values.filter(isWork).size)
    println(Weekday.values.toList.sortBy(_.id).map(_.toString.take(1)).mkString)
  }
}
