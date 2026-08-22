object CycleDetection {
  def hasCycle(graph: Map[Int, List[Int]]): Boolean = {
    val visited = scala.collection.mutable.Set[Int]()
    val inStack = scala.collection.mutable.Set[Int]()

    def dfs(node: Int): Boolean = {
      visited += node
      inStack += node
      for (neighbor <- graph.getOrElse(node, Nil)) {
        if (!visited.contains(neighbor)) {
          if (dfs(neighbor)) return true
        } else if (inStack.contains(neighbor)) {
          return true
        }
      }
      inStack -= node
      false
    }

    graph.keys.exists(k => !visited.contains(k) && dfs(k))
  }

  def main(args: Array[String]): Unit = {
    val acyclic = Map(0 -> List(1), 1 -> List(2), 2 -> List())
    val cyclic = Map(0 -> List(1), 1 -> List(2), 2 -> List(0))
    println(hasCycle(acyclic))
    println(hasCycle(cyclic))
  }
}
