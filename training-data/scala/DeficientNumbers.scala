object DeficientNumbers extends App {
  def sigma(n: Int): Int = (1 to n).filter(n % _ == 0).sum
  println((1 to 20).filter(n => sigma(n) < 2 * n).mkString(" "))
}
