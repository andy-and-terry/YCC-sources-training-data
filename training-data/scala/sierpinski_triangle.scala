@main def sierpinski(): Unit =
  val n = 8
  for r <- 0 until n do
    val row = (0 to r).map(c => if (r & c) == c then "* " else "  ").mkString
    println(" " * (n - r - 1) + row)
