object CaesarCipher {
  def shift(c: Char, k: Int): Char =
    if (c.isLower) rotate(c, 'a', k)
    else if (c.isUpper) rotate(c, 'A', k)
    else c

  private def rotate(c: Char, base: Char, k: Int): Char =
    (base + ((c - base + k) % 26 + 26) % 26).toChar

  def encrypt(text: String, k: Int): String = text.map(shift(_, k))

  def main(args: Array[String]): Unit = {
    val secret = encrypt("Hello, World!", 3)
    println(secret)
    println(encrypt(secret, -3))
  }
}
