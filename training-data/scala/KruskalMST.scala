class DisjointSet(n: Int) {
  private val parent = Array.tabulate(n)(identity)

  def find(x: Int): Int = {
    if (parent(x) != x) parent(x) = find(parent(x))
    parent(x)
  }

  def union(a: Int, b: Int): Boolean = {
    val rootA = find(a)
    val rootB = find(b)
    if (rootA == rootB) false
    else {
      parent(rootA) = rootB
      true
    }
  }
}

object KruskalMST {
  case class Edge(u: Int, v: Int, weight: Int)

  def mst(n: Int, edges: List[Edge]): (List[Edge], Int) = {
    val dsu = new DisjointSet(n)
    val sorted = edges.sortBy(_.weight)
    val chosen = sorted.filter(e => dsu.union(e.u, e.v))
    (chosen, chosen.map(_.weight).sum)
  }

  def main(args: Array[String]): Unit = {
    val edges = List(
      Edge(0, 1, 4), Edge(0, 2, 1), Edge(2, 1, 2),
      Edge(1, 3, 5), Edge(2, 3, 8), Edge(3, 4, 3)
    )
    val (chosen, total) = mst(5, edges)
    chosen.foreach(e => println(s"${e.u} - ${e.v} : ${e.weight}"))
    println(s"total weight: $total")
  }
}
