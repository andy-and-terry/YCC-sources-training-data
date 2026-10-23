object LuckyNumbers {
  def lucky(limit: Int): Vector[Int] = {
    var nums = (1 until limit by 2).toVector
    var i = 1
    while (i < nums.length && nums(i) <= nums.length) {
      val step = nums(i)
      nums = nums.zipWithIndex.collect { case (v, idx) if (idx + 1) % step != 0 => v }
      i += 1
    }
    nums
  }

  def main(args: Array[String]): Unit =
    println(lucky(100).mkString(" "))
}
