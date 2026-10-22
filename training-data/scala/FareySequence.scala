object FareySequence {
  def farey(n: Int): List[String] = {
    @annotation.tailrec
    def go(a: Int, b: Int, c: Int, d: Int, acc: List[String]): List[String] =
      if (c > n) acc.reverse
      else {
        val k = (n + b) / d
        go(c, d, k * c - a, k * d - b, s"$c/$d" :: acc)
      }
    go(0, 1, 1, n, List("0/1"))
  }

  def main(args: Array[String]): Unit =
    println(farey(5).mkString(" "))
}
