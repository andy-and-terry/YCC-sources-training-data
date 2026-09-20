object FloydWarshall {
  val INF: Int = Int.MaxValue / 2

  def shortestPaths(n: Int, edges: List[(Int, Int, Int)]): Array[Array[Int]] = {
    val dist = Array.fill(n, n)(INF)
    for (i <- 0 until n) dist(i)(i) = 0
    for ((u, v, w) <- edges) dist(u)(v) = w

    for (k <- 0 until n; i <- 0 until n; j <- 0 until n) {
      if (dist(i)(k) + dist(k)(j) < dist(i)(j)) {
        dist(i)(j) = dist(i)(k) + dist(k)(j)
      }
    }
    dist
  }

  def main(args: Array[String]): Unit = {
    val edges = List((0, 1, 3), (1, 2, 1), (0, 2, 10), (2, 3, 2), (1, 3, 7))
    val dist = shortestPaths(4, edges)
    dist.foreach(row => println(row.mkString(" ")))
  }
}
