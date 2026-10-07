import scala.collection.mutable

object MemoGetOrElseUpdateDemo {
  private val fibCache = mutable.Map[Int, BigInt]()

  def fib(n: Int): BigInt =
    if (n < 2) BigInt(n)
    else fibCache.getOrElseUpdate(n, fib(n - 1) + fib(n - 2))

  def memoize[A, B](f: A => B): A => B = {
    val cache = mutable.Map.empty[A, B]
    a => cache.getOrElseUpdate(a, f(a))
  }

  def gridPaths(r: Int, c: Int, memo: mutable.Map[(Int, Int), Long] = mutable.Map.empty): Long =
    if (r == 0 || c == 0) 1L
    else memo.getOrElseUpdate((r, c), gridPaths(r - 1, c, memo) + gridPaths(r, c - 1, memo))

  def main(args: Array[String]): Unit = {
    println(fib(90))

    var calls = 0
    val slowSquare = (n: Int) => { calls += 1; n * n }
    val fast = memoize(slowSquare)
    println(List(3, 3, 4, 3, 4).map(fast))
    println(s"underlying calls: $calls")

    println(gridPaths(16, 16))

    val groups = mutable.Map[Char, mutable.ListBuffer[String]]()
    for (w <- List("apple", "avocado", "banana"))
      groups.getOrElseUpdate(w.head, mutable.ListBuffer.empty) += w
    println(groups.toList.sortBy(_._1).map { case (k, v) => k -> v.toList })
  }
}
