import scala.annotation.tailrec

object UlamNumbers {
  def ulam(count: Int): Vector[Int] = {
    def ways(seq: Vector[Int], candidate: Int): Int =
      (for {
        i <- seq.indices
        j <- i + 1 until seq.length
        if seq(i) + seq(j) == candidate
      } yield 1).size

    @tailrec
    def go(seq: Vector[Int], candidate: Int): Vector[Int] =
      if (seq.length >= count) seq
      else if (ways(seq, candidate) == 1) go(seq :+ candidate, candidate + 1)
      else go(seq, candidate + 1)

    go(Vector(1, 2), 3)
  }

  def main(args: Array[String]): Unit =
    println(ulam(15).mkString(" "))
}
