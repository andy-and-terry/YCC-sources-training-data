// Hamming numbers (5-smooth): only prime factors 2, 3 and 5
object HammingNumbers extends App {
  def isHamming(start: Int): Boolean = {
    var n = start
    for (p <- Seq(2, 3, 5)) while (n % p == 0) n /= p
    n == 1
  }

  println(Iterator.from(1).filter(isHamming).take(20).mkString(" "))
}
