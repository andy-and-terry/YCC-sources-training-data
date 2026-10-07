final class Meters(val value: Double) extends AnyVal {
  def +(other: Meters): Meters = new Meters(value + other.value)
  def toFeet: Double = value * 3.28084
  override def toString: String = s"${value}m"
}

object ValueClassDemo {
  def main(args: Array[String]): Unit = {
    val a = new Meters(10)
    val b = new Meters(2.5)
    println(a + b)
    println(f"${(a + b).toFeet}%.2f ft")
  }
}
