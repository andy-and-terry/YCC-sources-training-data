import scala.collection.mutable

object GraphBFSDFS {
  def bfs(graph: Map[Int, List[Int]], start: Int): List[Int] = {
    val visited = mutable.LinkedHashSet[Int](start)
    val queue = mutable.Queue[Int](start)
    while (queue.nonEmpty) {
      val node = queue.dequeue()
      for (neighbor <- graph.getOrElse(node, Nil) if !visited.contains(neighbor)) {
        visited += neighbor
        queue.enqueue(neighbor)
      }
    }
    visited.toList
  }

  def dfs(graph: Map[Int, List[Int]], start: Int): List[Int] = {
    val visited = mutable.LinkedHashSet[Int]()
    def go(node: Int): Unit = {
      if (!visited.contains(node)) {
        visited += node
        graph.getOrElse(node, Nil).foreach(go)
      }
    }
    go(start)
    visited.toList
  }

  def main(args: Array[String]): Unit = {
    val graph = Map(
      1 -> List(2, 3),
      2 -> List(4),
      3 -> List(4),
      4 -> List(5),
      5 -> List()
    )
    println(bfs(graph, 1))
    println(dfs(graph, 1))
  }
}
