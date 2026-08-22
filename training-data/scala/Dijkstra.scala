object Dijkstra {
  def dijkstra(graph: Map[String, Map[String, Int]], source: String): Map[String, Int] = {
    var dist = graph.keys.map(k => k -> Int.MaxValue).toMap
    dist += (source -> 0)
    var visited = Set[String]()

    while (visited.size < graph.size) {
      val u = dist.filterNot { case (k, _) => visited.contains(k) }.minByOption(_._2).map(_._1)
      u match {
        case None => visited = graph.keySet
        case Some(node) =>
          visited += node
          for ((neighbor, weight) <- graph.getOrElse(node, Map())) {
            val alt = dist(node) + weight
            if (alt < dist(neighbor)) dist += (neighbor -> alt)
          }
      }
    }
    dist
  }

  def main(args: Array[String]): Unit = {
    val graph = Map(
      "A" -> Map("B" -> 4, "C" -> 1),
      "B" -> Map("A" -> 4, "C" -> 2, "D" -> 5),
      "C" -> Map("A" -> 1, "B" -> 2, "D" -> 8),
      "D" -> Map("B" -> 5, "C" -> 8)
    )
    dijkstra(graph, "A").toSeq.sortBy(_._1).foreach { case (k, v) => println(s"$k: $v") }
  }
}
