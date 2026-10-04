object ZipUnzipDemo {
  def main(args: Array[String]): Unit = {
    val names = List("ann", "bob", "cy")
    val ages = List(31, 25, 40)

    val pairs = names.zip(ages)
    println(pairs)

    val (ns, as) = pairs.unzip
    println(ns)
    println(as)

    println(names.zipWithIndex)
    println(names.zip(ages).toMap)
    println(List(1, 2, 3).zip(List("a", "b")))
    println(List(1, 2, 3).zipAll(List("a"), 0, "?"))

    val triples = names.lazyZip(ages).lazyZip(List(true, false, true)).toList
    println(triples)
    val (a, b, c) = triples.unzip3
    println((a, b, c))

    val oldest = pairs.maxBy(_._2)
    println(oldest)
    println(ages.zip(ages.tail).map { case (x, y) => y - x })
    println(names.zip(ages).filter(_._2 > 30).map(_._1))
    println(List(1, 2, 3, 4).sliding(2).map(_.sum).toList)
  }
}
