import scala.annotation.tailrec

object LuckyNumbers {
  def lucky(limit: Int): Vector[Int] = {
    @tailrec
    def sieve(nums: Vector[Int], i: Int): Vector[Int] =
      if (i < nums.length && nums(i) <= nums.length) {
        val step = nums(i)
        val kept = nums.zipWithIndex.collect { case (v, idx) if (idx + 1) % step != 0 => v }
        sieve(kept, i + 1)
      } else nums

    sieve((1 to limit by 2).toVector, 1)
  }

  def main(args: Array[String]): Unit =
    println(lucky(50).mkString(" "))
}
