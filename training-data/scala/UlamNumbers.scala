import scala.annotation.tailrec

object UlamNumbers {
  def ulam(count: Int): Vector[Int] = {
    @tailrec
    def build(seq: Vector[Int], n: Int): Vector[Int] =
      if (seq.length >= count) seq
      else {
        val ways = seq.count(a => n - a > a && seq.contains(n - a))
        build(if (ways == 1) seq :+ n else seq, n + 1)
      }

    build(Vector(1, 2), 3)
  }

  def main(args: Array[String]): Unit =
    println(ulam(15).mkString(" "))
}
