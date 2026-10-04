object ByNameParameterDemo {
  def log(enabled: Boolean)(msg: => String): Unit =
    if (enabled) println(s"LOG: $msg")

  def expensiveMessage(): String = {
    println("  (building message)")
    "details"
  }

  def twice(block: => Unit): Unit = {
    block
    block
  }

  def timeIt[A](label: String)(body: => A): A = {
    val start = System.nanoTime()
    val result = body
    val elapsedMs = (System.nanoTime() - start) / 1e6
    println(s"$label finished (took ${if (elapsedMs >= 0) "some" else "no"} time)")
    result
  }

  def myAnd(a: Boolean, b: => Boolean): Boolean = if (a) b else false

  def whileLoop(cond: => Boolean)(body: => Unit): Unit =
    if (cond) { body; whileLoop(cond)(body) }

  def main(args: Array[String]): Unit = {
    log(enabled = false)(expensiveMessage())
    log(enabled = true)(expensiveMessage())

    var count = 0
    twice { count += 1; println(s"count = $count") }

    println(timeIt("sum")((1 to 1000).sum))
    println(myAnd(false, sys.error("never evaluated")))

    var i = 0
    whileLoop(i < 3) { println(s"i = $i"); i += 1 }
  }
}
