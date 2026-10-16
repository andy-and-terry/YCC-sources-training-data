object NothingNullUnitTypes {
  def fail(msg: String): Nothing = throw new IllegalStateException(msg)

  def positive(n: Int): Int = if (n > 0) n else fail("not positive")

  def log(s: String): Unit = println("log: " + s)

  def main(args: Array[String]): Unit = {
    println(positive(5))
    try positive(-1)
    catch { case e: IllegalStateException => println(e.getMessage) }

    val u: Unit = log("hello")
    println(u)
    println(u == ())

    val s: String = null
    println(Option(s).getOrElse("was null"))
    val xs: List[Nothing] = Nil
    println(xs.length)
    val anyVal: Any = 3
    println(anyVal.isInstanceOf[Int])
    println(Option.empty[Int].orElse(Some(0)))
  }
}
