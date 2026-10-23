object WoodallNumbers {
  def woodall(n: Int): Long = n * (1L << n) - 1

  def main(args: Array[String]): Unit = {
    println((1 to 10).map(woodall).mkString(" "))
  }
}
