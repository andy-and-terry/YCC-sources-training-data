object Rot47Cipher extends App {
  def rot47(s: String): String =
    s.map(c => if (c >= 33 && c <= 126) (33 + (c - 33 + 47) % 94).toChar else c)

  val e = rot47("Hello, World!")
  println(s"$e ${rot47(e)}")
}
