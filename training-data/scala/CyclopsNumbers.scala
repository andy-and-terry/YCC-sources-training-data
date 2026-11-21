// Cyclops numbers: odd digit count, middle digit zero, no other zeros.
// Count those in 1..99999 (expected 6642).
object CyclopsNumbers {
  def isCyclops(n: Int): Boolean = {
    val s = n.toString
    s.length % 2 == 1 && s(s.length / 2) == '0' && s.count(_ == '0') == 1
  }

  def main(args: Array[String]): Unit =
    println((1 until 100000).count(isCyclops))
}
