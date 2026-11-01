object FoldLeftWordCountEx extends App {
  val text = "the cat and the hat and the bat"
  val counts = text.split(" ").foldLeft(Map.empty[String, Int]) { (m, w) =>
    m.updated(w, m.getOrElse(w, 0) + 1)
  }
  println(counts.toList.sortBy(-_._2).take(3))
}
