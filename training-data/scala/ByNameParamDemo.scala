object ByNameParamDemo {
  // `=> A` delays evaluation until the parameter is used (each time).
  def twice[A](body: => A): (A, A) = (body, body)

  def timed[A](label: String)(body: => A): A = {
    val start = System.nanoTime()
    val result = body
    val micros = (System.nanoTime() - start) / 1000
    println(s"$label finished (took >= 0 us: ${micros >= 0})")
    result
  }

  def myAnd(a: Boolean, b: => Boolean): Boolean = if (a) b else false

  def retry[A](times: Int)(op: => A): Option[A] = {
    var attempt = 0
    while (attempt < times) {
      attempt += 1
      try return Some(op)
      catch { case e: RuntimeException => println(s"attempt $attempt failed: ${e.getMessage}") }
    }
    None
  }

  def main(args: Array[String]): Unit = {
    var n = 0
    println(twice { n += 1; n })

    println(timed("sum") { (1 to 1000).sum })

    println(myAnd(false, { println("never printed"); true }))
    println(myAnd(true, { println("evaluated"); true }))

    var calls = 0
    val r = retry(3) {
      calls += 1
      if (calls < 3) throw new RuntimeException(s"boom $calls") else "ok"
    }
    println(r)
  }
}
