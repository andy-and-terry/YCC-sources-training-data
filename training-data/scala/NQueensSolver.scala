object NQueensSolver {
  def solve(n: Int): Int = {
    def isSafe(cols: List[Int], row: Int, col: Int): Boolean =
      cols.zipWithIndex.forall { case (c, r) =>
        c != col && math.abs(c - col) != math.abs(r - row)
      }

    def place(row: Int, cols: List[Int]): Int =
      if (row == n) 1
      else (0 until n).filter(col => isSafe(cols, row, col))
        .map(col => place(row + 1, cols :+ col))
        .sum

    place(0, Nil)
  }

  def main(args: Array[String]): Unit = {
    println(solve(4))
    println(solve(8))
  }
}
