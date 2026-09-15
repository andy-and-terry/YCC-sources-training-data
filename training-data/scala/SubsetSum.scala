object SubsetSum {
  def isSubsetSum(values: List[Int], target: Int): Boolean = {
    val reachable = Array.fill(target + 1)(false)
    reachable(0) = true
    for (v <- values) {
      for (s <- target to v by -1) {
        if (reachable(s - v)) reachable(s) = true
      }
    }
    reachable(target)
  }

  def main(args: Array[String]): Unit = {
    val values = List(3, 34, 4, 12, 5, 2)
    println(isSubsetSum(values, 9))   // true  (4 + 5)
    println(isSubsetSum(values, 10))  // true  (3 + 5 + 2)
    println(isSubsetSum(values, 13))  // false
    println(isSubsetSum(Nil, 0))      // true
  }
}
