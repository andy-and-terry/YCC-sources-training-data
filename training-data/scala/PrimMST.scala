import scala.collection.mutable

object PrimMST {
  case class Edge(to: String, weight: Int)

  def mst(graph: Map[String, List[Edge]], start: String): (List[(String, String, Int)], Int) = {
    val visited = mutable.Set[String](start)
    val pq = mutable.PriorityQueue[(Int, String, String)]()(Ordering.by((e: (Int, String, String)) => e._1).reverse)
    graph.getOrElse(start, Nil).foreach(e => pq.enqueue((e.weight, start, e.to)))

    var chosen = List[(String, String, Int)]()
    var total = 0

    while (pq.nonEmpty && visited.size < graph.size) {
      val (weight, from, to) = pq.dequeue()
      if (!visited.contains(to)) {
        visited += to
        chosen = chosen :+ (from, to, weight)
        total += weight
        graph.getOrElse(to, Nil).foreach { e =>
          if (!visited.contains(e.to)) pq.enqueue((e.weight, to, e.to))
        }
      }
    }
    (chosen, total)
  }

  def main(args: Array[String]): Unit = {
    val graph = Map(
      "A" -> List(Edge("B", 4), Edge("C", 1)),
      "B" -> List(Edge("A", 4), Edge("C", 2), Edge("D", 5)),
      "C" -> List(Edge("A", 1), Edge("B", 2), Edge("D", 8)),
      "D" -> List(Edge("B", 5), Edge("C", 8))
    )
    val (chosen, total) = mst(graph, "A")
    chosen.foreach { case (from, to, w) => println(s"$from - $to : $w") }
    println(s"total weight: $total")
  }
}
