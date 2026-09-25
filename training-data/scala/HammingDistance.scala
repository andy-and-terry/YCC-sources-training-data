object HammingDistance {
  def distance(a: String, b: String): Option[Int] =
    Option.when(a.length == b.length)(a.lazyZip(b).count(_ != _))

  def main(args: Array[String]): Unit = {
    println(distance("GAGCCTACTAACGGGAT", "CATCGTAATGACGGCCT"))
    println(distance("AB", "A"))
  }
}
