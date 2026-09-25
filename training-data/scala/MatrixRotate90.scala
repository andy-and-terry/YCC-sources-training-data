object MatrixRotate90 {
  def rotateClockwise[A](m: Seq[Seq[A]]): Seq[Seq[A]] = m.transpose.map(_.reverse)
  def rotateCounterClockwise[A](m: Seq[Seq[A]]): Seq[Seq[A]] = m.map(_.reverse).transpose

  def main(args: Array[String]): Unit = {
    val m = Seq(Seq(1, 2, 3), Seq(4, 5, 6), Seq(7, 8, 9))
    rotateClockwise(m).foreach(r => println(r.mkString(" ")))
    rotateCounterClockwise(m).foreach(r => println(r.mkString(" ")))
  }
}
