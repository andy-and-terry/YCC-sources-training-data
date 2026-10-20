object ForComprehensionMultiGenerators {
  def main(args: Array[String]): Unit = {
    val pairs = for {
      x <- 1 to 4
      y <- x to 4
      if (x + y) % 3 == 0
    } yield (x, y)
    println(pairs)
    val triples = for (a <- 1 to 20; b <- a to 20; c <- b to 20 if a * a + b * b == c * c) yield (a, b, c)
    println(triples)
    val flat = for (xs <- List(List(1, 2), List(3)); x <- xs) yield x * 10
    println(flat)
    for (i <- 1 to 3; j = i * i) print(s"$i->$j ")
    println()
  }
}
