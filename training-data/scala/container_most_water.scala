import scala.annotation.tailrec

object ContainerMostWater {
  def maxArea(h: Array[Int]): Int = {
    @tailrec
    def go(lo: Int, hi: Int, best: Int): Int =
      if (lo >= hi) best
      else {
        val area = math.min(h(lo), h(hi)) * (hi - lo)
        if (h(lo) < h(hi)) go(lo + 1, hi, best max area) else go(lo, hi - 1, best max area)
      }
    go(0, h.length - 1, 0)
  }

  def main(args: Array[String]): Unit =
    println(maxArea(Array(1, 8, 6, 2, 5, 4, 8, 3, 7))) // 49
}
