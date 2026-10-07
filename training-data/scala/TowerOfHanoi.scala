object TowerOfHanoi {
  def solve(n: Int, source: String = "A", auxiliary: String = "B", target: String = "C"): List[String] = {
    if (n == 0) Nil
    else
      solve(n - 1, source, target, auxiliary) :::
        List(s"move disk $n from $source to $target") :::
        solve(n - 1, auxiliary, source, target)
  }

  def main(args: Array[String]): Unit = {
    val moves = solve(3)
    moves.foreach(println)
    println(s"total moves: ${moves.size}")
  }
}
