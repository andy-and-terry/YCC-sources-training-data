object MapMergeDemo {
  def merge(a: Map[String, Int], b: Map[String, Int]): Map[String, Int] =
    b.foldLeft(a) { case (acc, (k, v)) => acc.updated(k, acc.getOrElse(k, 0) + v) }

  def main(args: Array[String]): Unit = {
    val a = Map("x" -> 1, "y" -> 2)
    val b = Map("y" -> 10, "z" -> 5)
    println(merge(a, b))
    println(a ++ b)
    println(a.view.mapValues(_ * 100).toMap)
    println((a.keySet intersect b.keySet))
    println(a.filter { case (_, v) => v > 1 })
    println(a.map { case (k, v) => (k.toUpperCase, v + 1) })
    println(a.removed("x") + ("q" -> 0))
    println(b.toList.sortBy(-_._2))
  }
}
