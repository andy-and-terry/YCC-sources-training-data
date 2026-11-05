object ImplicitExt extends App {
  implicit class RichInt(val n: Int) extends AnyVal {
    def squared: Int = n * n
    def isEven: Boolean = n % 2 == 0
  }
  println(7.squared)
  println(10.isEven)
}
