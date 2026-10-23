object RangeStepUntilDemo extends App {
  // to is inclusive, until is exclusive, by sets the step.
  println((1 to 5).toList)
  println((1 until 5).toList)
  println((0 to 20 by 5).toList)
  println((10 to 1 by -3).toList)

  // Ranges are lazy sequences of constant size.
  val big = 1 to 1000000
  println(big.size)
  println(big.sum)

  // Empty and reversed ranges
  println((5 to 1).isEmpty)
  println((1 to 5).reverse.toList)

  // Long and Double ranges
  println((1L to 3L).toList)
  println(BigDecimal(0) to BigDecimal(1) by BigDecimal("0.25"))

  // Chars
  println(('a' to 'e').mkString)

  // Using ranges with higher-order functions
  println((1 to 5).map(i => i * i))
  println((1 to 10).filter(_ % 3 == 0))
  println((1 to 4).foldLeft(1)(_ * _))

  // Indexing loops
  val names = Vector("x", "y", "z")
  for (i <- names.indices) println(s"$i -> ${names(i)}")
  for (i <- names.length - 1 to 0 by -1) print(names(i))
  println()
}
