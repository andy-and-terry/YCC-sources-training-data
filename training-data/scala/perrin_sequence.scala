// Perrin sequence P(n)=P(n-2)+P(n-3)
object PerrinSequence extends App {
  val v = scala.collection.mutable.ArrayBuffer(3, 0, 2)
  for (i <- 3 until 10) v += v(i - 2) + v(i - 3)
  println(v.mkString(" "))
}
