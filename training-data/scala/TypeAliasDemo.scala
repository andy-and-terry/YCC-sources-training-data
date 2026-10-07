object TypeAliasDemo {
  type Point = (Double, Double)
  type Predicate[A] = A => Boolean
  type Graph = Map[Int, List[Int]]

  def distance(a: Point, b: Point): Double =
    math.hypot(a._1 - b._1, a._2 - b._2)

  def filterBy[A](xs: List[A])(p: Predicate[A]): List[A] = xs.filter(p)

  def degree(g: Graph, node: Int): Int = g.getOrElse(node, Nil).size

  def main(args: Array[String]): Unit = {
    println(distance((0.0, 0.0), (3.0, 4.0)))
    println(filterBy(List(1, 2, 3, 4, 5))(_ > 2))
    val g: Graph = Map(1 -> List(2, 3), 2 -> List(3))
    println(degree(g, 1))
  }
}
