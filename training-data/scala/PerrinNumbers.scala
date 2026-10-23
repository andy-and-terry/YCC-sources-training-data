// Perrin numbers: P(0) = 3, P(1) = 0, P(2) = 2, P(n) = P(n-2) + P(n-3)
object PerrinNumbers extends App {
  val p = scala.collection.mutable.ArrayBuffer(3L, 0L, 2L)
  for (n <- 3 until 15) p += p(n - 2) + p(n - 3)
  println(p.mkString(" "))
}
