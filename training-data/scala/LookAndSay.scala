object LookAndSay {
  def next(s: String): String =
    if (s.isEmpty) ""
    else {
      val (run, rest) = s.span(_ == s.head)
      s"${run.length}${s.head}" + next(rest)
    }

  def main(args: Array[String]): Unit = LazyList.iterate("1")(next).take(8).foreach(println)
}
