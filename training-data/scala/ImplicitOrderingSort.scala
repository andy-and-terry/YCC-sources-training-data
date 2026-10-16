object ImplicitOrderingSort {
  case class Version(major: Int, minor: Int, patch: Int)

  implicit val versionOrdering: Ordering[Version] =
    Ordering.by(v => (v.major, v.minor, v.patch))

  def newest[A](xs: List[A])(implicit ord: Ordering[A]): A = xs.max

  def main(args: Array[String]): Unit = {
    val vs = List(Version(1, 2, 3), Version(1, 10, 0), Version(0, 9, 9), Version(1, 2, 10))
    println(vs.sorted)
    println(newest(vs))
    println(vs.sorted(versionOrdering.reverse).head)
    println(newest(List("pear", "apple", "zebra")))
    import Ordering.Implicits._
    println(Version(2, 0, 0) > Version(1, 99, 99))
  }
}
