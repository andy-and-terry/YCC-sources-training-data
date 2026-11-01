// Leyland numbers: x^y + y^x for x >= y >= 2.
object LeylandNumbers {
  def leyland(x: Int, y: Int): BigInt = BigInt(x).pow(y) + BigInt(y).pow(x)

  def main(args: Array[String]): Unit = {
    val vals = for (x <- 2 to 4; y <- 2 to x) yield leyland(x, y)
    println(vals.mkString(" "))
  }
}
