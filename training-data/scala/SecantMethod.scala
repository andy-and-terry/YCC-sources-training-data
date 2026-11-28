import scala.annotation.tailrec

object SecantMethod extends App {
  @tailrec
  def secant(f: Double => Double, x0: Double, x1: Double, n: Int = 50): Double = {
    val (f0, f1) = (f(x0), f(x1))
    if (n == 0 || f1 == f0) x1
    else {
      val next = x1 - f1 * (x1 - x0) / (f1 - f0)
      if (math.abs(next - x1) < 1e-12) next else secant(f, x1, next, n - 1)
    }
  }

  println(secant(x => x * x - 2, 1, 2))
}
