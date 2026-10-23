// Scala 3: opaque types give zero-cost type safety outside their defining scope.
object Units:
  opaque type Meters = Double
  opaque type Seconds = Double

  object Meters:
    def apply(d: Double): Meters = d
  object Seconds:
    def apply(d: Double): Seconds = d

  extension (m: Meters)
    def +(other: Meters): Meters = m + other
    def value: Double = m
    def per(t: Seconds): Double = m / t

  extension (s: Seconds)
    def seconds: Double = s

import Units.*

@main def opaqueTypeDemo(): Unit =
  val distance = Meters(100.0) + Meters(20.5)
  val time = Seconds(12.0)
  println(f"${distance.value}%.1f m")
  println(f"${distance.per(time)}%.2f m/s")
  println(time.seconds)
  // val bad: Meters = 3.0   // does not compile: Double is not a Meters here
