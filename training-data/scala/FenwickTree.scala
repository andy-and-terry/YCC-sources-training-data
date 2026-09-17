class FenwickTree(n: Int) {
  private val tree = Array.fill(n + 1)(0)

  def update(index: Int, delta: Int): Unit = {
    var i = index + 1
    while (i <= n) {
      tree(i) += delta
      i += i & (-i)
    }
  }

  def prefixSum(index: Int): Int = {
    var i = index + 1
    var sum = 0
    while (i > 0) {
      sum += tree(i)
      i -= i & (-i)
    }
    sum
  }

  def rangeSum(left: Int, right: Int): Int = prefixSum(right) - (if (left == 0) 0 else prefixSum(left - 1))
}

object FenwickTree {
  def main(args: Array[String]): Unit = {
    val values = Array(3, 2, -1, 6, 5, 4, -3, 3, 7, 2)
    val tree = new FenwickTree(values.length)
    values.zipWithIndex.foreach { case (v, i) => tree.update(i, v) }

    println(tree.rangeSum(0, 5))
    println(tree.rangeSum(3, 7))

    tree.update(2, 10)
    println(tree.rangeSum(0, 5))
  }
}
