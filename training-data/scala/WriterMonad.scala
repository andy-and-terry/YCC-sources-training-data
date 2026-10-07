case class Writer[A](value: A, log: List[String]) {
  def map[B](f: A => B): Writer[B] = Writer(f(value), log)

  def flatMap[B](f: A => Writer[B]): Writer[B] = {
    val Writer(b, moreLog) = f(value)
    Writer(b, log ++ moreLog)
  }
}

object Writer {
  def point[A](value: A): Writer[A] = Writer(value, Nil)
  def tell(msg: String): Writer[Unit] = Writer((), List(msg))
}

object WriterMonad {
  def add(a: Int, b: Int): Writer[Int] =
    for {
      _ <- Writer.tell(s"adding $a and $b")
      result = a + b
      _ <- Writer.tell(s"result is $result")
    } yield result

  def main(args: Array[String]): Unit = {
    val computation = for {
      x <- add(2, 3)
      y <- add(x, 10)
    } yield y

    println(computation.value)
    computation.log.foreach(println)
  }
}
