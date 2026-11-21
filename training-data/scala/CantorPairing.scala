// Cantor pairing function and its inverse.
object CantorPairing {
  def pair(x: Long, y: Long): Long = (x + y) * (x + y + 1) / 2 + y

  def unpair(z: Long): (Long, Long) = {
    val w = ((math.sqrt(8.0 * z + 1) - 1) / 2).toLong
    val y = z - w * (w + 1) / 2
    (w - y, y)
  }

  def main(args: Array[String]): Unit = {
    println(pair(3, 4))
    val (x, y) = unpair(32)
    println(s"$x $y")
  }
}
