object MapTransformDemo {
  def main(args: Array[String]): Unit = {
    val m = Map("a" -> 1, "b" -> 2, "c" -> 3)
    println(m.map { case (k, v) => k.toUpperCase -> v * 10 })
    println(m.view.mapValues(_ + 1).toMap)
    println(m.filter(_._2 > 1))
    println(m.getOrElse("z", 0))
    println(m.get("a").map(_ + 1))
    println(m + ("d" -> 4) - "a")
    println(m.updated("b", 20)("b"))
    println(m.keys.toList.sorted, m.values.sum)
    println(m.foldLeft(0) { case (acc, (_, v)) => acc + v })
    println(m.toList.sortBy(-_._2).head)
    val merged = m ++ Map("c" -> 30, "e" -> 5)
    println(merged)
    println(m.withDefaultValue(-1)("missing"))
    println(m.exists(_._2 == 2), m.forall(_._2 > 0))
  }
}
