object CollectionOps extends App {
  val xs = List(1, 2, 3, 4, 5, 6)
  println(xs.foldLeft(0)(_ + _))
  println(xs.groupBy(_ % 3))
  println(xs.partition(_ > 3))
  println(xs.sliding(3).toList)
  println(xs.zipWithIndex.collect { case (x, i) if i % 2 == 0 => x })
}
