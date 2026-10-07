object TrappingRainWater {
  def trap(heights: Array[Int]): Int = {
    if (heights.isEmpty) return 0

    var left = 0
    var right = heights.length - 1
    var leftMax = heights(left)
    var rightMax = heights(right)
    var trapped = 0

    while (left < right) {
      if (leftMax <= rightMax) {
        left += 1
        leftMax = math.max(leftMax, heights(left))
        trapped += leftMax - heights(left)
      } else {
        right -= 1
        rightMax = math.max(rightMax, heights(right))
        trapped += rightMax - heights(right)
      }
    }
    trapped
  }

  def main(args: Array[String]): Unit = {
    println(trap(Array(0, 1, 0, 2, 1, 0, 1, 3, 2, 1, 2, 1)))
    println(trap(Array(4, 2, 0, 3, 2, 5)))
  }
}
