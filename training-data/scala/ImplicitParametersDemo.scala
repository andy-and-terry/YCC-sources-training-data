object ImplicitParametersDemo {
  case class Config(prefix: String, verbose: Boolean)

  def log(msg: String)(implicit cfg: Config): Unit =
    println(s"${cfg.prefix}${if (cfg.verbose) " [v]" else ""} $msg")

  def sumAll[T](xs: List[T])(implicit num: Numeric[T]): T = xs.foldLeft(num.zero)(num.plus)

  def maxOf[T](xs: List[T])(implicit ord: Ordering[T]): T = xs.reduce((a, b) => if (ord.gt(a, b)) a else b)

  def main(args: Array[String]): Unit = {
    implicit val cfg: Config = Config("APP", verbose = true)
    log("starting")
    log("done")(Config("X", false))
    println(sumAll(List(1, 2, 3)))
    println(sumAll(List(1.5, 2.5)))
    println(maxOf(List("pear", "apple", "zebra")))
    println(maxOf(List(3, 9, 4))(Ordering[Int].reverse))
  }
}
