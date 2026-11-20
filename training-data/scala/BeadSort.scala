// Bead (gravity) sort.
object BeadSort {
  def sort(nums: List[Int]): List[Int] = {
    val cols = (0 until nums.max).map(i => nums.count(_ > i))
    nums.indices.map(r => cols.count(_ > r)).reverse.toList
  }
  def main(args: Array[String]): Unit = println(sort(List(5, 3, 1, 4, 2)))
}
