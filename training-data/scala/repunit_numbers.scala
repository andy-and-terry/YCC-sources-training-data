// Repunits: numbers made only of the digit 1.
@main def repunitNumbers(): Unit =
  val repunits = LazyList.iterate(1L)(r => r * 10 + 1).take(5).toList
  println(repunits)
