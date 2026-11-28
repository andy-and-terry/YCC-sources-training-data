def lisLength(a: Seq[Int]): Int =
  a.foldLeft(Vector.empty[Int]) { (tails, x) =>
    val i = tails.indexWhere(_ >= x) match
      case -1 => tails.length
      case j  => j
    if i == tails.length then tails :+ x else tails.updated(i, x)
  }.length

@main def run(): Unit = println(lisLength(Seq(10, 9, 2, 5, 3, 7, 101, 18)))
