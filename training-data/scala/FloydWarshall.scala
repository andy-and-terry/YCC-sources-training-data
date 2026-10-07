object FloydWarshall {
  val INF: Int = Int.MaxValue / 2

  def shortestPaths(graph: Array[Array[Int]]): Array[Array[Int]] = {
    val n = graph.length
    val dist = Array.tabulate(n, n)((i, j) => graph(i)(j))

    for (k <- 0 until n) {
      for (i <- 0 until n) {
        for (j <- 0 until n) {
          if (dist(i)(k) + dist(k)(j) < dist(i)(j)) {
            dist(i)(j) = dist(i)(k) + dist(k)(j)
          }
        }
      }
    }
    dist
  }

  def main(args: Array[String]): Unit = {
    val graph = Array(
      Array(0, 3, INF, 7),
      Array(8, 0, 2, INF),
      Array(5, INF, 0, 1),
      Array(2, INF, INF, 0)
    )

    val dist = shortestPaths(graph)
    dist.foreach(row => println(row.map(v => if (v >= INF) "INF" else v.toString).mkString(" ")))
  }
}
