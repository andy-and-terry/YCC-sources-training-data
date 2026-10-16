object TakeDropWhile {
  def main(args: Array[String]): Unit = {
    val xs = List(2, 4, 6, 7, 8, 10)
    println(xs.takeWhile(_ % 2 == 0))
    println(xs.dropWhile(_ % 2 == 0))
    println(xs.span(_ < 7))
    println(xs.partition(_ > 5))
    println(xs.find(_ > 6))
    println(xs.exists(_ == 7))
    println(xs.forall(_ % 2 == 0))
    println(xs.count(_ > 4))
    println(xs.drop(2).take(2))
    println(xs.dropRight(1).last)
    println(xs.indexOf(7))
  }
}
