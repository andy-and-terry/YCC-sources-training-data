@main def rollingHash(): Unit =
  val s = "abcabc"; val k = 3; val B = 31L; val M = 1000003L
  val pw = (1 until k).foldLeft(1L)((a, _) => a * B % M)
  var h = s.take(k).foldLeft(0L)((a, c) => (a * B + c) % M)
  println(s"0 $h")
  for i <- 1 to s.length - k do
    h = (h - s(i - 1) * pw % M + M) % M
    h = (h * B + s(i + k - 1)) % M
    println(s"$i $h")
