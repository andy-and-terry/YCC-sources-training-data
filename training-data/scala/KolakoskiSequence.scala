import scala.collection.mutable.ArrayBuffer

object KolakoskiSequence {
  def kolakoski(count: Int): Vector[Int] = {
    val seq = ArrayBuffer(1, 2, 2)
    var i = 2
    while (seq.length < count) {
      val value = if (i % 2 == 0) 1 else 2
      for (_ <- 0 until seq(i)) seq += value
      i += 1
    }
    seq.take(count).toVector
  }

  def main(args: Array[String]): Unit =
    println(kolakoski(20).mkString(" "))
}
