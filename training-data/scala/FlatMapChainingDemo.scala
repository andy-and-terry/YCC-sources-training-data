object FlatMapChainingDemo {
  def parse(s: String): Option[Int] = s.toIntOption

  def safeDiv(a: Int, b: Int): Option[Int] = if (b == 0) None else Some(a / b)

  def main(args: Array[String]): Unit = {
    println(List(1, 2, 3).flatMap(n => List(n, n * 10)))
    println(List("a b", "c d e").flatMap(_.split(" ")))
    println(List(Some(1), None, Some(3)).flatten)
    println(List(1, 2, 3).map(n => List(n)).flatten)

    val viaFlatMap = parse("20").flatMap(a => parse("4").flatMap(b => safeDiv(a, b)))
    println(viaFlatMap)

    val viaFor = for {
      a <- parse("20")
      b <- parse("0")
      q <- safeDiv(a, b)
    } yield q
    println(viaFor)

    val pairs = for {
      x <- 1 to 3
      y <- 1 to 3
      if x < y
    } yield (x, y)
    println(pairs.toList)

    val nested = (1 to 3).flatMap(x => (1 to x).map(y => x * y))
    println(nested.toList)

    println(Option(3).flatMap(n => if (n > 2) Some(n * 2) else None))
    println(List(1, 2, 3, 4).flatMap(n => if (n % 2 == 0) Some(n) else None))
    println(List("1", "x", "3").flatMap(parse))
    println(List("1", "x", "3").map(parse).sequence)
  }

  implicit class Seqs(xs: List[Option[Int]]) {
    def sequence: Option[List[Int]] =
      xs.foldRight(Option(List.empty[Int]))((o, acc) => for (v <- o; vs <- acc) yield v :: vs)
  }
}
