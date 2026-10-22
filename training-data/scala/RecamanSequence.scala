object RecamanSequence {
  def recaman(count: Int): Vector[Int] =
    (1 until count).foldLeft((Vector(0), Set(0))) { case ((seq, seen), n) =>
      val back = seq.last - n
      val next = if (back > 0 && !seen(back)) back else seq.last + n
      (seq :+ next, seen + next)
    }._1

  def main(args: Array[String]): Unit =
    println(recaman(20).mkString(" "))
}
