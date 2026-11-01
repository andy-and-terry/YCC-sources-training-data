// Reverse-and-add until a palindrome; count the steps.
object LychrelSteps {
  def reverse(n: BigInt): BigInt = BigInt(n.toString.reverse)

  def steps(start: Int): Int = {
    var n = BigInt(start)
    for (count <- 0 until 100) {
      if (count > 0 && n == reverse(n)) return count
      n += reverse(n)
    }
    -1
  }

  def main(args: Array[String]): Unit =
    println(List(56, 57, 59, 79, 89).map(steps).mkString(" "))
}
