object SaddlePoints {
  def find(m: Seq[Seq[Int]]): Seq[(Int, Int)] =
    if (m.isEmpty) Nil
    else {
      val colMin = m.transpose.map(_.min)
      for {
        (row, r) <- m.zipWithIndex
        rowMax = row.max
        (v, c) <- row.zipWithIndex
        if v == rowMax && v == colMin(c)
      } yield (r, c)
    }

  def main(args: Array[String]): Unit = println(find(Seq(Seq(9, 8, 7), Seq(5, 3, 2), Seq(6, 6, 7))))
}
