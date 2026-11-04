object ToeplitzCheck extends App {
  def isToeplitz(m: Seq[Seq[Int]]): Boolean =
    m.sliding(2).forall { case Seq(prev, cur) => cur.tail == prev.take(cur.size - 1) case _ => true }

  println(isToeplitz(Seq(Seq(1, 2, 3), Seq(4, 1, 2), Seq(5, 4, 1))))
  println(isToeplitz(Seq(Seq(1, 2), Seq(2, 2))))
}
