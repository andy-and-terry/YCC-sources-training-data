object SuperperfectNumbers {
  def sigma(n: Int): Int = (1 to n).filter(n % _ == 0).sum

  def main(args: Array[String]): Unit =
    println((1 until 100).filter(n => sigma(sigma(n)) == 2 * n).mkString(" ")) // 2 4 16 64
}
