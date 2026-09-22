object RadixSort {
  def sort(input: Array[Int]): Array[Int] = {
    if (input.isEmpty) return input
    var arr = input
    val max = arr.max
    var exp = 1
    while (max / exp > 0) {
      arr = countingSortByDigit(arr, exp)
      exp *= 10
    }
    arr
  }

  private def countingSortByDigit(arr: Array[Int], exp: Int): Array[Int] = {
    val output = Array.fill(arr.length)(0)
    val count = Array.fill(10)(0)

    for (num <- arr) count((num / exp) % 10) += 1
    for (i <- 1 until 10) count(i) += count(i - 1)

    for (i <- arr.indices.reverse) {
      val digit = (arr(i) / exp) % 10
      count(digit) -= 1
      output(count(digit)) = arr(i)
    }
    output
  }

  def main(args: Array[String]): Unit = {
    val arr = Array(170, 45, 75, 90, 802, 24, 2, 66)
    println(sort(arr).toList)
  }
}
