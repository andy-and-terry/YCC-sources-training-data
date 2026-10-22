import scala.annotation.tailrec

object KolakoskiSequence {
  def kolakoski(count: Int): Vector[Int] = {
    @tailrec
    def build(seq: Vector[Int], i: Int): Vector[Int] =
      if (seq.length >= count) seq.take(count)
      else build(seq ++ Vector.fill(seq(i))(3 - seq.last), i + 1)

    build(Vector(1, 2, 2), 2)
  }

  def main(args: Array[String]): Unit =
    println(kolakoski(20).mkString(" "))
}
