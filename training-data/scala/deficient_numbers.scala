// Deficient numbers below 100; expect 76.
object DeficientNumbers extends App {
  def properSum(n: Int): Int = (1 until n).filter(n % _ == 0).sum
  println((1 until 100).count(n => properSum(n) < n))
}
