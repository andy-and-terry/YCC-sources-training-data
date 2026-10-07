object ByNameParameterDemo {
  def eager(x: Int): Int = { println("eager body"); x + x }

  def byName(x: => Int): Int = { println("byName body"); x + x }

  def lazyOr(a: Boolean, b: => Boolean): Boolean = a || b

  def timed[T](label: String)(block: => T): T = {
    val start = System.nanoTime()
    val result = block
    val ms = (System.nanoTime() - start) / 1000000
    println(s"$label finished (took >= $ms ms)")
    result
  }

  def retry[T](n: Int)(op: => T): T =
    try op
    catch { case _: Exception if n > 1 => println(s"retrying, $n left"); retry(n - 1)(op) }

  def main(args: Array[String]): Unit = {
    def noisy(): Int = { println("evaluating"); 21 }
    println(eager(noisy()))
    println(byName(noisy()))
    println(lazyOr(true, { println("never printed"); false }))
    println(timed("sum")((1 to 1000).sum))
    var attempts = 0
    println(retry(3) { attempts += 1; if (attempts < 3) throw new RuntimeException("fail") else "ok" })
  }
}
