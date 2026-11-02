object ImplicitClassExtensionX2 extends App {
  implicit class RichInt(val n: Int) extends AnyVal {
    def squared: Int = n * n
  }
  println(5.squared)
}
