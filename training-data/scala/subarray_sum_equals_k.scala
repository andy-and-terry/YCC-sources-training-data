// Count contiguous subarrays whose sum equals k (prefix sums + mutable Map).
import scala.collection.mutable

def countSubarrays(nums: Seq[Int], k: Int): Int =
  val seen = mutable.Map(0 -> 1)
  var total = 0
  var count = 0
  for x <- nums do
    total += x
    count += seen.getOrElse(total - k, 0)
    seen(total) = seen.getOrElse(total, 0) + 1
  count

@main def subarraySumEqualsK(): Unit =
  println(countSubarrays(Seq(1, 1, 1), 2))
