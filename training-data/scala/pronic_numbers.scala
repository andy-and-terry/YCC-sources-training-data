object PronicNumbers extends App {
  def isPronic(x: Long): Boolean = {
    val n = math.sqrt(x.toDouble).toLong
    n * (n + 1) == x
  }

  println((0 until 10).map(n => n * (n + 1)).toList) // List(0, 2, 6, 12, 20, 30, 42, 56, 72, 90)
  println((isPronic(56), isPronic(57))) // (true,false)
}
