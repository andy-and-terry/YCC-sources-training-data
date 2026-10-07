object DutchNationalFlag {
  def sortColors(arr: Array[Int], pivot: Int = 1): Array[Int] = {
    var low = 0
    var mid = 0
    var high = arr.length - 1

    while (mid <= high) {
      if (arr(mid) < pivot) {
        val tmp = arr(low); arr(low) = arr(mid); arr(mid) = tmp
        low += 1
        mid += 1
      } else if (arr(mid) == pivot) {
        mid += 1
      } else {
        val tmp = arr(mid); arr(mid) = arr(high); arr(high) = tmp
        high -= 1
      }
    }
    arr
  }

  def main(args: Array[String]): Unit = {
    println(sortColors(Array(2, 0, 2, 1, 1, 0)).mkString(","))
    println(sortColors(Array(2, 0, 1)).mkString(","))
  }
}
