object PowerSetCombinations {
  def powerSet[A](xs: List[A]): List[List[A]] = xs match {
    case Nil => List(Nil)
    case h :: t =>
      val rest = powerSet(t)
      rest ++ rest.map(h :: _)
  }

  def main(args: Array[String]): Unit = {
    println(powerSet(List(1, 2, 3)).sortBy(l => (l.size, l.mkString)))
    println(List(1, 2, 3, 4).combinations(2).toList)
    println(List('a', 'b', 'c').permutations.map(_.mkString).toList)
    println(List(1, 2, 3).subsets().size)
    println(List(1, 2).flatMap(a => List("x", "y").map(b => (a, b))))
    println(List(1, 2, 3).tails.toList)
    println(List(1, 2, 3).inits.toList)
  }
}
