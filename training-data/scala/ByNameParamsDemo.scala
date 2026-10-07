object ByNameParamsDemo {
  def evalTwice(block: => Int): Int = block + block

  def myAnd(a: Boolean, b: => Boolean): Boolean = if (a) b else false

  def timed[T](label: String)(body: => T): T = {
    val start = System.nanoTime()
    val result = body
    val micros = (System.nanoTime() - start) / 1000
    println(s"$label finished (took >= 0 us: ${micros >= 0})")
    result
  }

  def main(args: Array[String]): Unit = {
    var calls = 0
    val r = evalTwice { calls += 1; 5 }
    println(s"result=$r calls=$calls")

    println(myAnd(false, { println("never printed"); true }))
    println(timed("sum")((1 to 1000).sum))
  }
}
