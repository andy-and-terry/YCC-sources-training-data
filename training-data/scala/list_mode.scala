object ListMode {
  def modes[A: Ordering](items: Seq[A]): Seq[A] = {
    val counts = items.groupBy(identity).view.mapValues(_.size).toMap
    val top = counts.values.max
    counts.collect { case (k, c) if c == top => k }.toSeq.sorted
  }

  def main(args: Array[String]): Unit = println(modes(Seq(1, 2, 2, 3, 3, 4)))
}
