object HappyNumbers extends App {
  def isHappy(start: Int): Boolean = {
    val seen = scala.collection.mutable.Set[Int]()
    var n = start
    while (n != 1 && seen.add(n)) n = n.toString.map(c => (c - '0') * (c - '0')).sum
    n == 1
  }

  println(LazyList.from(1).filter(isHappy).take(8).toList) // List(1, 7, 10, 13, 19, 23, 28, 31)
}
