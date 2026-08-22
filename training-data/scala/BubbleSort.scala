object BubbleSort {
  def bubbleSort(arr: Array[Int]): Array[Int] = {
    val a = arr.clone()
    for (i <- a.indices) {
      for (j <- 0 until a.length - i - 1) {
        if (a(j) > a(j + 1)) {
          val tmp = a(j)
          a(j) = a(j + 1)
          a(j + 1) = tmp
        }
      }
    }
    a
  }

  def main(args: Array[String]): Unit = {
    println(bubbleSort(Array(5, 2, 9, 1, 5, 6)).mkString(","))
  }
}
