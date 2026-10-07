object TriangleClassify {
  sealed trait Kind
  case object Equilateral extends Kind
  case object Isosceles extends Kind
  case object Scalene extends Kind

  def classify(a: Double, b: Double, c: Double): Option[Kind] = {
    val Seq(x, y, z) = Seq(a, b, c).sorted
    if (x <= 0 || x + y <= z) None
    else Some(Set(a, b, c).size match {
      case 1 => Equilateral
      case 2 => Isosceles
      case _ => Scalene
    })
  }

  def main(args: Array[String]): Unit =
    Seq((3.0, 3.0, 3.0), (3.0, 4.0, 4.0), (3.0, 4.0, 5.0), (1.0, 1.0, 3.0))
      .foreach { case (a, b, c) => println(classify(a, b, c).getOrElse("invalid")) }
}
