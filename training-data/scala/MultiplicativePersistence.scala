object MultiplicativePersistence extends App {
  @scala.annotation.tailrec
  def persistence(n: Long, steps: Int = 0): Int =
    if (n < 10) steps
    else persistence(n.toString.map(c => (c - '0').toLong).product, steps + 1)

  List(39L, 77L, 999L, 10L).foreach(n => println(s"$n ${persistence(n)}"))
}
