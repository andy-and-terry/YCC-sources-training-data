import scala.collection.mutable

object TopologicalSort {
  def topSort(graph: Map[Int, List[Int]], nodeCount: Int): List[Int] = {
    val inDegree = Array.fill(nodeCount)(0)
    for ((_, neighbors) <- graph; n <- neighbors) inDegree(n) += 1
    val queue = mutable.Queue((0 until nodeCount).filter(inDegree(_) == 0): _*)
    val result = mutable.ListBuffer[Int]()
    while (queue.nonEmpty) {
      val node = queue.dequeue()
      result += node
      for (neighbor <- graph.getOrElse(node, Nil)) {
        inDegree(neighbor) -= 1
        if (inDegree(neighbor) == 0) queue.enqueue(neighbor)
      }
    }
    result.toList
  }

  def main(args: Array[String]): Unit = {
    val graph = Map(0 -> List(1, 2), 1 -> List(3), 2 -> List(3), 3 -> List())
    println(topSort(graph, 4))
  }
}
