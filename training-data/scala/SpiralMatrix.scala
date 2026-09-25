object SpiralMatrix {
  def spiral(n: Int): Array[Array[Int]] = {
    val g = Array.fill(n, n)(0)
    val dirs = Vector((0, 1), (1, 0), (0, -1), (-1, 0))
    var (r, c, d) = (0, 0, 0)
    for (k <- 1 to n * n) {
      g(r)(c) = k
      val (nr, nc) = (r + dirs(d)._1, c + dirs(d)._2)
      if (nr < 0 || nr >= n || nc < 0 || nc >= n || g(nr)(nc) != 0) d = (d + 1) % 4
      r += dirs(d)._1
      c += dirs(d)._2
    }
    g
  }

  def main(args: Array[String]): Unit = spiral(4).foreach(row => println(row.mkString("\t")))
}
