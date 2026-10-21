// Narayana's cows: N(0) = N(1) = N(2) = 1, N(n) = N(n-1) + N(n-3)
object NarayanaCowsSequence extends App {
  val n = scala.collection.mutable.ArrayBuffer(1L, 1L, 1L)
  for (i <- 3 until 15) n += n(i - 1) + n(i - 3)
  println(n.mkString(" "))
}
