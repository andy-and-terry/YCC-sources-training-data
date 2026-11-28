object JaccardSimilarity extends App {
  def jaccard[T](a: Set[T], b: Set[T]): Double =
    if ((a union b).isEmpty) 1.0 else (a intersect b).size.toDouble / (a union b).size
  println(jaccard(Set(1, 2, 3, 4), Set(3, 4, 5)))
}
