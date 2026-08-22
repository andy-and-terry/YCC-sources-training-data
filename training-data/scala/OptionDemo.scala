object OptionDemo {
  def safeDivide(a: Int, b: Int): Option[Int] =
    if (b == 0) None else Some(a / b)

  def main(args: Array[String]): Unit = {
    val results = List((10, 2), (5, 0), (9, 3))
    results.foreach { case (a, b) =>
      safeDivide(a, b) match {
        case Some(v) => println(s"$a / $b = $v")
        case None => println(s"$a / $b = undefined")
      }
    }

    val values = List(Some(1), None, Some(3))
    println(values.flatten.sum)
  }
}
