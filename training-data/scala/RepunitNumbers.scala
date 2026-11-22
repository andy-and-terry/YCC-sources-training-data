// Repunits: R_k = (10^k - 1) / 9, built as r = 10r + 1.
object RepunitNumbers {
  def main(args: Array[String]): Unit = {
    val repunits = Iterator.iterate(BigInt(1))(r => r * 10 + 1).take(8).toList
    println(repunits.mkString(" "))
  }
}
