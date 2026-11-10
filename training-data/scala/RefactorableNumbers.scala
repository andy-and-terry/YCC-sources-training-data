object RefactorableNumbers {
  def tau(n: Int): Int = (1 to n).count(n % _ == 0)

  def main(args: Array[String]): Unit =
    println((1 until 60).filter(n => n % tau(n) == 0).mkString(" ")) // 1 2 8 9 12 18 24 36 40 56
}
