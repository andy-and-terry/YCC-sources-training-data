object ReaderMonadDemo {
  case class Reader[R, A](run: R => A) {
    def map[B](f: A => B): Reader[R, B] = Reader(r => f(run(r)))
    def flatMap[B](f: A => Reader[R, B]): Reader[R, B] = Reader(r => f(run(r)).run(r))
  }

  case class Config(host: String, port: Int, debug: Boolean)

  val host: Reader[Config, String] = Reader(_.host)
  val port: Reader[Config, Int] = Reader(_.port)
  val debug: Reader[Config, Boolean] = Reader(_.debug)

  val url: Reader[Config, String] = for {
    h <- host
    p <- port
    d <- debug
  } yield s"http://$h:$p" + (if (d) "?debug=1" else "")

  def main(args: Array[String]): Unit = {
    println(url.run(Config("localhost", 8080, true)))
    println(url.run(Config("example.org", 80, false)))
  }
}
