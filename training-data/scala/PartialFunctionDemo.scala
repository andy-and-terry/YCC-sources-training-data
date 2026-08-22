object PartialFunctionDemo {
  val reciprocal: PartialFunction[Double, Double] = {
    case x if x != 0.0 => 1.0 / x
  }

  def main(args: Array[String]): Unit = {
    println(reciprocal.isDefinedAt(0.0))
    println(reciprocal.isDefinedAt(2.0))
    println(reciprocal(2.0))
    println(List(1.0, 2.0, 0.0, 4.0).collect(reciprocal))
  }
}
