import scala.collection.mutable

object AStarSearch {
  type Cell = (Int, Int)

  def heuristic(a: Cell, b: Cell): Int = math.abs(a._1 - b._1) + math.abs(a._2 - b._2)

  def aStar(grid: Array[Array[Int]], start: Cell, goal: Cell): Option[List[Cell]] = {
    val rows = grid.length
    val cols = grid(0).length
    val cameFrom = mutable.Map[Cell, Cell]()
    val gScore = mutable.Map[Cell, Int](start -> 0)
    val open = mutable.PriorityQueue[(Int, Cell)]()(Ordering.by(-_._1))
    open.enqueue((heuristic(start, goal), start))
    val visited = mutable.Set[Cell]()

    while (open.nonEmpty) {
      val (_, current) = open.dequeue()
      if (current == goal) {
        val path = mutable.ListBuffer(current)
        var node = current
        while (cameFrom.contains(node)) {
          node = cameFrom(node)
          path.prepend(node)
        }
        return Some(path.toList)
      }
      if (!visited(current)) {
        visited += current
        val (r, c) = current
        val neighbors = List((r - 1, c), (r + 1, c), (r, c - 1), (r, c + 1))
        for (n @ (nr, nc) <- neighbors
             if nr >= 0 && nr < rows && nc >= 0 && nc < cols && grid(nr)(nc) == 0) {
          val tentative = gScore(current) + 1
          if (tentative < gScore.getOrElse(n, Int.MaxValue)) {
            cameFrom(n) = current
            gScore(n) = tentative
            open.enqueue((tentative + heuristic(n, goal), n))
          }
        }
      }
    }
    None
  }

  def main(args: Array[String]): Unit = {
    val grid = Array(
      Array(0, 0, 0, 0),
      Array(1, 1, 0, 1),
      Array(0, 0, 0, 0),
      Array(0, 1, 1, 0)
    )
    println(aStar(grid, (0, 0), (3, 3)))
  }
}
