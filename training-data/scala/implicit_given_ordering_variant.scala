object GivenDemo extends App {
  case class Ver(major: Int, minor: Int)
  given Ordering[Ver] = Ordering.by(v => (v.major, v.minor))

  println(List(Ver(1, 2), Ver(1, 0), Ver(0, 9)).sorted)
}
