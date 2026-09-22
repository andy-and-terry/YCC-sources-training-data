import scala.util.Random

object QuickSelect {
  def quickSelect(arr: Array[Int], k: Int): Int = {
    val a = arr.clone()

    def partition(lo: Int, hi: Int): Int = {
      val pivot = a(hi)
      var i = lo
      for (j <- lo until hi) {
        if (a(j) < pivot) {
          val tmp = a(i); a(i) = a(j); a(j) = tmp
          i += 1
        }
      }
      val tmp = a(i); a(i) = a(hi); a(hi) = tmp
      i
    }

    def select(lo: Int, hi: Int, k: Int): Int = {
      if (lo == hi) a(lo)
      else {
        val p = partition(lo, hi)
        if (k == p) a(p)
        else if (k < p) select(lo, p - 1, k)
        else select(p + 1, hi, k)
      }
    }

    select(0, a.length - 1, k)
  }

  def main(args: Array[String]): Unit = {
    val arr = Array(7, 10, 4, 3, 20, 15)
    println(quickSelect(arr, 2))
    println(quickSelect(arr, 0))
  }
}
