object HeapSort {
  def heapify(arr: Array[Int], n: Int, i: Int): Unit = {
    var largest = i
    val left = 2 * i + 1
    val right = 2 * i + 2
    if (left < n && arr(left) > arr(largest)) largest = left
    if (right < n && arr(right) > arr(largest)) largest = right
    if (largest != i) {
      val temp = arr(i)
      arr(i) = arr(largest)
      arr(largest) = temp
      heapify(arr, n, largest)
    }
  }

  def heapSort(arr: Array[Int]): Array[Int] = {
    val n = arr.length
    for (i <- n / 2 - 1 to 0 by -1) heapify(arr, n, i)
    for (i <- n - 1 to 1 by -1) {
      val temp = arr(0)
      arr(0) = arr(i)
      arr(i) = temp
      heapify(arr, i, 0)
    }
    arr
  }

  def main(args: Array[String]): Unit = {
    println(heapSort(Array(5, 3, 8, 1, 9, 2)).mkString(","))
  }
}
