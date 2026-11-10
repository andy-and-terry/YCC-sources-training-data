object MoserDeBruijn {
  // Read the binary digits of i as base-4 digits.
  def moserDeBruijn(i: Int): Long = java.lang.Long.parseLong(Integer.toBinaryString(i), 4)

  def main(args: Array[String]): Unit =
    println((0 until 10).map(moserDeBruijn).mkString(" ")) // 0 1 4 5 16 17 20 21 64 65
}
