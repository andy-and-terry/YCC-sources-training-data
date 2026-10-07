object AsciiHistogram {
  def render(s: String, width: Int = 30): String = {
    val counts = s.groupMapReduce(identity)(_ => 1)(_ + _).toSeq.sortBy(_._1)
    val peak = counts.map(_._2).max
    counts.map { case (k, n) => s"$k | ${"#" * math.max(1, n * width / peak)} $n" }.mkString("\n")
  }

  def main(args: Array[String]): Unit = println(render("theraininspainfallsmainlyontheplain"))
}
