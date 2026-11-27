object RailFenceCipher extends App {
  def encode(text: String, rails: Int): String = {
    val period = 2 * (rails - 1)
    val rail = (i: Int) => { val m = i % period; if (m < rails) m else period - m }
    text.zipWithIndex.sortBy { case (_, i) => (rail(i), i) }.map(_._1).mkString
  }

  println(encode("WEAREDISCOVERED", 3))
}
