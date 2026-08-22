object BinarySearch {
  def binarySearch(arr: Array[Int], target: Int): Int = {
    var low = 0
    var high = arr.length - 1
    while (low <= high) {
      val mid = (low + high) / 2
      if (arr(mid) == target) return mid
      else if (arr(mid) < target) low = mid + 1
      else high = mid - 1
    }
    -1
  }

  def main(args: Array[String]): Unit = {
    val sorted = Array(1, 3, 5, 7, 9, 11, 13)
    println(binarySearch(sorted, 7))
    println(binarySearch(sorted, 4))
  }
}
