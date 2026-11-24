// Aliquot sequence: replace n by the sum of its proper divisors.
import scala.collection.mutable.ListBuffer

object AliquotSequence {
  def aliquotSum(n: Int): Int = (1 to n / 2).filter(n % _ == 0).sum

  def main(args: Array[String]): Unit = {
    val seq = ListBuffer(12)
    while (seq.last > 1 && seq.size < 20) seq += aliquotSum(seq.last)
    println(seq.mkString(" "))
  }
}
