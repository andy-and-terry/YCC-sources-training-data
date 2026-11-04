final case class MinStack[A](items: List[(A, A)] = Nil)(implicit ord: Ordering[A]) {
  def push(x: A): MinStack[A] = {
    val m = items.headOption.map(h => ord.min(h._2, x)).getOrElse(x)
    copy((x, m) :: items)
  }
  def pop: MinStack[A] = copy(items.tail)
  def min: A = items.head._2
}

object ImmutableMinStack extends App {
  val s = List(5, 3, 7, 2).foldLeft(MinStack[Int]())(_ push _)
  println(s.min)
  println(s.pop.min)
}
