class SegmentTree(arr: Array[Int]) {
  private val n = arr.length
  private val tree = Array.fill(4 * n)(0)

  build(0, 0, n - 1)

  private def build(node: Int, start: Int, end: Int): Unit = {
    if (start == end) {
      tree(node) = arr(start)
    } else {
      val mid = (start + end) / 2
      build(2 * node + 1, start, mid)
      build(2 * node + 2, mid + 1, end)
      tree(node) = tree(2 * node + 1) + tree(2 * node + 2)
    }
  }

  def query(node: Int, start: Int, end: Int, l: Int, r: Int): Int = {
    if (r < start || end < l) 0
    else if (l <= start && end <= r) tree(node)
    else {
      val mid = (start + end) / 2
      query(2 * node + 1, start, mid, l, r) + query(2 * node + 2, mid + 1, end, l, r)
    }
  }
}

object SegmentTreeDemo {
  def main(args: Array[String]): Unit = {
    val arr = Array(1, 3, 5, 7, 9, 11)
    val tree = new SegmentTree(arr)
    println(tree.query(0, 0, arr.length - 1, 1, 3))
  }
}
