class UnionFind(n: Int) {
  private val parent = Array.tabulate(n)(identity)
  private val rank = Array.fill(n)(0)

  def find(x: Int): Int = {
    if (parent(x) != x) parent(x) = find(parent(x))
    parent(x)
  }

  def union(a: Int, b: Int): Unit = {
    val rootA = find(a)
    val rootB = find(b)
    if (rootA != rootB) {
      if (rank(rootA) < rank(rootB)) parent(rootA) = rootB
      else if (rank(rootA) > rank(rootB)) parent(rootB) = rootA
      else { parent(rootB) = rootA; rank(rootA) += 1 }
    }
  }

  def connected(a: Int, b: Int): Boolean = find(a) == find(b)
}

object UnionFindDemo {
  def main(args: Array[String]): Unit = {
    val uf = new UnionFind(6)
    uf.union(0, 1)
    uf.union(1, 2)
    println(uf.connected(0, 2))
    println(uf.connected(0, 5))
  }
}
