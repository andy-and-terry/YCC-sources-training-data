object EquilibriumIndex {
  def find(nums: Vector[Int]): Int = {
    val total = nums.sum
    val prefix = nums.scanLeft(0)(_ + _) // prefix(i) = sum of nums(0 until i)
    nums.indices.find(i => prefix(i) == total - prefix(i) - nums(i)).getOrElse(-1)
  }

  def main(args: Array[String]): Unit =
    println(find(Vector(1, 7, 3, 6, 5, 6))) // 3
}
