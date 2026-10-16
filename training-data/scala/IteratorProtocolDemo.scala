object IteratorProtocolDemo {
  class Countdown(from: Int) extends Iterator[Int] {
    private var cur = from
    def hasNext: Boolean = cur > 0
    def next(): Int = {
      val r = cur
      cur -= 1
      r
    }
  }

  def main(args: Array[String]): Unit = {
    println(new Countdown(5).toList)
    val it = new Countdown(10).filter(_ % 3 == 0).map(_ * 2)
    while (it.hasNext) print(it.next() + " ")
    println()

    val buffered = Iterator(1, 2, 3).buffered
    println(buffered.head)
    println(buffered.next())
    println(Iterator.iterate(1)(_ * 2).take(8).toList)
    println(Iterator.continually("z").take(3).mkString)
    println(new Countdown(4).sliding(2).toList)
  }
}
