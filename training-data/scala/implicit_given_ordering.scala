object GivenDemo extends App {
  case class P(name: String, age: Int)
  given Ordering[P] = Ordering.by(_.age)
  println(List(P("a", 30), P("b", 20)).sorted)
}
