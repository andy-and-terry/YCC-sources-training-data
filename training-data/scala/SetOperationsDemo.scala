object SetOperationsDemo {
  def main(args: Array[String]): Unit = {
    val a = Set(1, 2, 3, 4)
    val b = Set(3, 4, 5)
    println(a union b)
    println(a intersect b)
    println(a diff b)
    println(a & b, a | b, a -- b)
    println(a.subsetOf(a | b))
    println(a.map(_ % 2))
    println((a ++ b).toList.sorted)
    println(a.contains(2), a(9))
    val sorted = scala.collection.immutable.SortedSet(5, 1, 3)
    println(sorted, sorted.head)
    val mut = scala.collection.mutable.Set[String]()
    mut += "x"
    mut ++= List("y", "x")
    println(mut.size)
    println(List(1, 2, 2, 3, 3).distinct, List(1, 2, 2).toSet.size)
  }
}
