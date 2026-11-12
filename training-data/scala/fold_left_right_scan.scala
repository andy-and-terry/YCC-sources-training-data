object Folds extends App {
  val xs = List(1, 2, 3, 4)
  println(xs.foldLeft(0)(_ + _))
  println(xs.foldRight(List.empty[Int])((x, acc) => acc :+ x))
  println(xs.scanLeft(0)(_ + _))
}
