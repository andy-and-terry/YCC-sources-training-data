object RailFenceCipher extends App {
  def order(n: Int, k: Int): Seq[Int] = {
    val cycle = 2 * (k - 1)
    (0 until n).sortBy { i => val r = i % cycle; if (r < k) r else cycle - r }
  }
  def encrypt(t: String, k: Int): String = order(t.length, k).map(t).mkString
  def decrypt(c: String, k: Int): String = {
    val out = new Array[Char](c.length)
    order(c.length, k).zipWithIndex.foreach { case (i, pos) => out(i) = c(pos) }
    out.mkString
  }
  val c = encrypt("WEAREDISCOVERED", 3)
  println(s"$c ${decrypt(c, 3)}")
}
