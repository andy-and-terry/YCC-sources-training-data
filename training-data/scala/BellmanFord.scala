object BellmanFord {
  case class Edge(u: Int, v: Int, weight: Int)

  def shortestPaths(n: Int, edges: List[Edge], src: Int): Either[String, Array[Int]] = {
    val dist = Array.fill(n)(Int.MaxValue)
    dist(src) = 0

    for (_ <- 1 until n) {
      for (edge <- edges) {
        if (dist(edge.u) != Int.MaxValue && dist(edge.u) + edge.weight < dist(edge.v)) {
          dist(edge.v) = dist(edge.u) + edge.weight
        }
      }
    }

    val hasNegativeCycle = edges.exists { edge =>
      dist(edge.u) != Int.MaxValue && dist(edge.u) + edge.weight < dist(edge.v)
    }

    if (hasNegativeCycle) Left("graph contains a negative-weight cycle")
    else Right(dist)
  }

  def main(args: Array[String]): Unit = {
    val edges = List(
      Edge(0, 1, 4), Edge(0, 2, 5), Edge(1, 2, -3),
      Edge(2, 3, 4), Edge(3, 1, 1)
    )
    shortestPaths(4, edges, 0) match {
      case Right(dist) => println(dist.toList)
      case Left(err)   => println(err)
    }
  }
}
