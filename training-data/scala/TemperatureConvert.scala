object TemperatureConvert {
  sealed abstract class Unit(val toC: Double => Double, val fromC: Double => Double)
  case object Celsius extends Unit(identity, identity)
  case object Fahrenheit extends Unit(v => (v - 32) * 5 / 9, c => c * 9 / 5 + 32)
  case object Kelvin extends Unit(_ - 273.15, _ + 273.15)

  def convert(v: Double, from: Unit, to: Unit): Double = to.fromC(from.toC(v))

  def main(args: Array[String]): Unit = {
    println(f"${convert(100, Celsius, Fahrenheit)}%.2f")
    println(f"${convert(212, Fahrenheit, Kelvin)}%.2f")
  }
}
