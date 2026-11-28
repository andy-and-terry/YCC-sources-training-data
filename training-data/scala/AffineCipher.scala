object AffineCipher extends App {
  def modInverse(a: Int, m: Int): Int = (1 until m).find(x => a * x % m == 1).get
  def affine(s: String, a: Int, b: Int, decrypt: Boolean = false): String = {
    val inv = modInverse(a, 26)
    s.map { ch =>
      if (!ch.isUpper) ch
      else {
        val x = ch - 'A'
        val y = if (decrypt) Math.floorMod(inv * (x - b), 26) else (a * x + b) % 26
        ('A' + y).toChar
      }
    }
  }
  val c = affine("AFFINE", 5, 8)
  println(s"$c ${affine(c, 5, 8, decrypt = true)}")
}
