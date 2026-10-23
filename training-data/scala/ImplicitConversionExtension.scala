object ImplicitConversionExtension {
  implicit class RichInt(private val n: Int) extends AnyVal {
    def isEven: Boolean = n % 2 == 0
    def times(f: => Unit): Unit = (1 to n).foreach(_ => f)
  }

  def main(args: Array[String]): Unit = {
    println(4.isEven)
    println(7.isEven)
    3.times(println("hi"))
  }
}
