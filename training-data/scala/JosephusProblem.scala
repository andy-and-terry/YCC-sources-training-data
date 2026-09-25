import scala.annotation.tailrec

object JosephusProblem {
  @tailrec
  def survivor(n: Int, k: Int, i: Int = 1, acc: Int = 0): Int = {
    if (i > n) acc else survivor(n, k, i + 1, (acc + k) % i)
  }

  def main(args: Array[String]): Unit = {
    println(survivor(7, 3))
    println(survivor(41, 3))
    println(survivor(1, 5))
  }
}
