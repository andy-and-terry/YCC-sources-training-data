object MaxSubArray {
  def maxSubArray(nums: Array[Int]): Int = {
    var maxSoFar = nums(0)
    var maxEndingHere = nums(0)
    for (i <- 1 until nums.length) {
      maxEndingHere = math.max(nums(i), maxEndingHere + nums(i))
      maxSoFar = math.max(maxSoFar, maxEndingHere)
    }
    maxSoFar
  }

  def main(args: Array[String]): Unit = {
    println(maxSubArray(Array(-2, 1, -3, 4, -1, 2, 1, -5, 4)))
  }
}
