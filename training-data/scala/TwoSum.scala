object TwoSum {
  def twoSum(nums: Array[Int], target: Int): Option[(Int, Int)] = {
    val seen = scala.collection.mutable.Map[Int, Int]()
    for (i <- nums.indices) {
      val complement = target - nums(i)
      if (seen.contains(complement)) return Some((seen(complement), i))
      seen(nums(i)) = i
    }
    None
  }

  def main(args: Array[String]): Unit = {
    println(twoSum(Array(2, 7, 11, 15), 9))
  }
}
