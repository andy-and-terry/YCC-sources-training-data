object DelannoyNumbers {
  def delannoy(size: Int): Array[Array[Long]] = {
    val d = Array.ofDim[Long](size, size)
    for (m <- 0 until size; n <- 0 until size)
      d(m)(n) = if (m == 0 || n == 0) 1L else d(m - 1)(n) + d(m)(n - 1) + d(m - 1)(n - 1)
    d
  }

  def main(args: Array[String]): Unit = {
    val d = delannoy(10)
    println((0 until 10).map(i => d(i)(i)).mkString(" "))
  }
}
