object KthLargestElement {
  def kthLargest(nums: List[Int], k: Int): Int =
    nums.sorted(Ordering.Int.reverse)(k - 1)

  def main(args: Array[String]): Unit = {
    println(kthLargest(List(3, 2, 1, 5, 6, 4), 2))
    println(kthLargest(List(3, 2, 3, 1, 2, 4, 5, 5, 6), 4))
  }
}
