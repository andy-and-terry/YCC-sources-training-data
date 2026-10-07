object MaxProductSubarray {
  def maxProduct(nums: Seq[Int]): Int =
    nums.tail.foldLeft((nums.head, nums.head, nums.head)) { case ((best, hi, lo), x) =>
      val candidates = Seq(x, hi * x, lo * x)
      val newHi = candidates.max
      (math.max(best, newHi), newHi, candidates.min)
    }._1

  def main(args: Array[String]): Unit =
    println(Seq(Seq(2, 3, -2, 4), Seq(-2, 0, -1), Seq(-2, 3, -4)).map(maxProduct).mkString(" "))
}
