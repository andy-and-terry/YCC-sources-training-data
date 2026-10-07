import scala.annotation.tailrec

object HappyNumber {
  private def step(n: Int): Int = n.toString.map(c => c.asDigit * c.asDigit).sum

  def isHappy(n: Int): Boolean = {
    @tailrec
    def loop(x: Int, seen: Set[Int]): Boolean =
      if (x == 1) true else if (seen(x)) false else loop(step(x), seen + x)
    loop(n, Set.empty)
  }

  def main(args: Array[String]): Unit = println((1 to 50).filter(isHappy).mkString(" "))
}
