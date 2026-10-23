object LucasLehmerTest {
  def lucasLehmer(p: Int): Boolean =
    p == 2 || {
      val m = (1L << p) - 1
      val s = (1 to p - 2).foldLeft(4L)((s, _) => (s * s - 2) % m)
      s == 0L
    }

  def main(args: Array[String]): Unit = {
    println(List(2, 3, 5, 7, 11, 13, 17, 19).filter(lucasLehmer).mkString(" "))
  }
}
