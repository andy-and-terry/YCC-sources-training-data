// Repunits: R_n = 11...1 (n ones), built as R_{n-1}*10 + 1.
object RepunitNumbers {
  def main(args: Array[String]): Unit = {
    val repunits = (1 to 8).scanLeft(0L)((r, _) => r * 10 + 1).tail
    repunits.foreach(r => println(s"$r" + (if (r % 3 == 0) "  (divisible by 3)" else "")))
  }
}
