// Munchausen numbers: sum of digit^digit equals n (0^0 counted as 0).
object MunchausenNumbers {
  def isMunchausen(n: Int): Boolean =
    n.toString.map(_ - '0').map(d => if (d == 0) 0 else math.pow(d, d).toInt).sum == n

  def main(args: Array[String]): Unit =
    println((1 until 5000).filter(isMunchausen).mkString(" "))
}
