import scala.collection.mutable

object SlidingWindowMaximum {
  def maxSlidingWindow(nums: Array[Int], k: Int): Array[Int] = {
    val deque = mutable.ArrayDeque.empty[Int]
    val result = mutable.ArrayBuffer.empty[Int]

    for (i <- nums.indices) {
      while (deque.nonEmpty && deque.head <= i - k) deque.removeHead()
      while (deque.nonEmpty && nums(deque.last) < nums(i)) deque.removeLast()
      deque.append(i)
      if (i >= k - 1) result.append(nums(deque.head))
    }
    result.toArray
  }

  def main(args: Array[String]): Unit = {
    val nums = Array(1, 3, -1, -3, 5, 3, 6, 7)
    println(maxSlidingWindow(nums, 3).mkString(","))
  }
}
