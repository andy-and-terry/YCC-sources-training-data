// Narayana's cows N(n)=N(n-1)+N(n-3)
object NarayanaCows extends App {
  val v = scala.collection.mutable.ArrayBuffer(1, 1, 1)
  for (i <- 3 until 10) v += v(i - 1) + v(i - 3)
  println(v.mkString(" "))
}
