class FenwickTree(n: Int) {
  private val tree = Array.fill(n + 1)(0)

  def update(i: Int, delta: Int): Unit = {
    var idx = i + 1
    while (idx < tree.length) {
      tree(idx) += delta
      idx += idx & (-idx)
    }
  }

  def prefixSum(i: Int): Int = {
    var idx = i + 1
    var sum = 0
    while (idx > 0) {
      sum += tree(idx)
      idx -= idx & (-idx)
    }
    sum
  }

  def rangeSum(l: Int, r: Int): Int = prefixSum(r) - (if (l == 0) 0 else prefixSum(l - 1))
}

object FenwickTreeDemo {
  def main(args: Array[String]): Unit = {
    val arr = Array(1, 3, 5, 7, 9, 11)
    val fenwick = new FenwickTree(arr.length)
    arr.zipWithIndex.foreach { case (v, i) => fenwick.update(i, v) }
    println(fenwick.prefixSum(3))
    println(fenwick.rangeSum(1, 4))
  }
}
