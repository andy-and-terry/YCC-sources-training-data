// lazyZip combines collections without building an intermediate tuple list.
@main def lazyZipDemo(): Unit =
  val names = List("ann", "bob", "cy")
  val ages = List(31, 25, 42)
  val cities = List("Oslo", "Rome", "Lima")

  val summaries = names.lazyZip(ages).lazyZip(cities).map { (n, a, c) =>
    s"$n ($a) from $c"
  }
  summaries.foreach(println)

  val adults = names.lazyZip(ages).filter((_, a) => a > 30)
  println(adults)

  val total = ages.lazyZip(List(1.0, 0.5, 2.0)).map(_ * _).sum
  println(total)

  // Compare to zip, which allocates tuples
  println(names.zip(ages).toMap)

  // lazyZip stops at the shorter collection
  println(List(1, 2, 3).lazyZip(List("a", "b")).toList)
