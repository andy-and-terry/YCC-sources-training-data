object InsertInterval {
  def insert(iv: List[(Int, Int)], n: (Int, Int)): List[(Int, Int)] = {
    val (before, rest) = iv.span(_._2 < n._1)
    val (overlap, after) = rest.span(_._1 <= n._2)
    val merged = overlap.foldLeft(n) { case ((lo, hi), (l, h)) => (lo min l, hi max h) }
    before ::: merged :: after
  }

  def main(args: Array[String]): Unit =
    println(insert(List((1, 3), (6, 9)), (2, 5))) // List((1,5), (6,9))
}
