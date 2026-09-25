import scala.language.implicitConversions

case class Celsius(value: Double)
case class Fahrenheit(value: Double)

object ImplicitConversionDemo {
  implicit def celsiusToFahrenheit(c: Celsius): Fahrenheit = Fahrenheit(c.value * 9.0 / 5.0 + 32)
  implicit def fahrenheitToCelsius(f: Fahrenheit): Celsius = Celsius((f.value - 32) * 5.0 / 9.0)

  def describeFahrenheit(f: Fahrenheit): String = s"${f.value}F"

  def main(args: Array[String]): Unit = {
    val boiling = Celsius(100)
    println(describeFahrenheit(boiling))

    val freezing = Fahrenheit(32)
    val asCelsius: Celsius = freezing
    println(asCelsius)
  }
}
