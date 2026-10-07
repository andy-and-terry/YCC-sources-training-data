import scala.annotation.tailrec

object PairSumSorted {
  def find(nums: IndexedSeq[Int], target: Int): Option[(Int, Int)] = {
    @tailrec
    def go(i: Int, j: Int): Option[(Int, Int)] =
      if (i >= j) None
      else {
        val s = nums(i) + nums(j)
        if (s == target) Some((i, j)) else if (s < target) go(i + 1, j) else go(i, j - 1)
      }
    go(0, nums.length - 1)
  }

  def main(args: Array[String]): Unit = {
    println(find(Vector(1, 3, 4, 6, 8, 11), 10))
    println(find(Vector(1, 2, 3), 100))
  }
}
