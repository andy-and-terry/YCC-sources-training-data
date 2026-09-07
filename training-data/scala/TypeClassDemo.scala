trait Show[T] {
  def show(value: T): String
}

object Show {
  implicit val intShow: Show[Int] = (value: Int) => s"Int($value)"
  implicit val stringShow: Show[String] = (value: String) => s"Str($value)"

  implicit def listShow[T](implicit ev: Show[T]): Show[List[T]] =
    (value: List[T]) => value.map(ev.show).mkString("[", ", ", "]")

  def apply[T](implicit ev: Show[T]): Show[T] = ev
}

object TypeClassDemo {
  def printShow[T](value: T)(implicit ev: Show[T]): Unit = println(ev.show(value))

  def main(args: Array[String]): Unit = {
    printShow(42)
    printShow("hello")
    printShow(List(1, 2, 3))
  }
}
