object Main extends App {
  implicit class RichInt(val n: Int) extends AnyVal {
    def isEven: Boolean = n % 2 == 0
    def times(f: => Unit): Unit = (1 to n).foreach(_ => f)
  }
  println(4.isEven)
  3.times(print("hi "))
  println()
}
