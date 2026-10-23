object VanEckSequence {
  def vanEck(count: Int): Vector[Int] =
    (0 until count - 1).foldLeft((Vector(0), Map.empty[Int, Int])) { case ((seq, lastSeen), n) =>
      val current = seq.last
      val next = lastSeen.get(current).map(n - _).getOrElse(0)
      (seq :+ next, lastSeen + (current -> n))
    }._1

  def main(args: Array[String]): Unit =
    println(vanEck(20).mkString(" "))
}
