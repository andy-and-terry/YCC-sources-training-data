object PermutationsGenerator {
  def permutations[A](xs: List[A]): List[List[A]] = xs match {
    case Nil => List(Nil)
    case _ =>
      for {
        (x, i) <- xs.zipWithIndex
        rest = xs.patch(i, Nil, 1)
        p <- permutations(rest)
      } yield x :: p
  }

  def main(args: Array[String]): Unit = {
    permutations(List(1, 2, 3)).foreach(p => println(p.mkString(" ")))
    println(List(1, 2, 3, 4).permutations.size)
    println(List(1, 2, 3).combinations(2).toList)
  }
}
