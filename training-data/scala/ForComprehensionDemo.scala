object ForComprehensionDemo {
  def main(args: Array[String]): Unit = {
    val evenSquares = for {
      n <- 1 to 10
      if n % 2 == 0
    } yield n * n

    println(evenSquares.toList)

    val pairs = for {
      x <- 1 to 3
      y <- 1 to 3
      if x != y
    } yield (x, y)

    println(pairs.toList)
  }
}
