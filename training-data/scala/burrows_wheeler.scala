def bwt(s: String): String =
  s.indices.map(i => s.drop(i) + s.take(i)).sorted.map(_.last).mkString

@main def run(): Unit = println(bwt("banana$"))
