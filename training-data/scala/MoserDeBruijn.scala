// Moser-de Bruijn sequence: binary digits of n read in base 4.
object MoserDeBruijn {
  def main(args: Array[String]): Unit =
    println((0 until 12).map(n => Integer.parseInt(Integer.toBinaryString(n), 4)).mkString(" "))
}
