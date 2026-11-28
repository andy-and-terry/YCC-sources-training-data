object WordFreq extends App {
  val freq = "a b a c b a".split(" ").foldLeft(Map.empty[String, Int]) { (m, w) =>
    m.updated(w, m.getOrElse(w, 0) + 1)
  }
  println(freq.toSeq.sortBy(-_._2))
}
