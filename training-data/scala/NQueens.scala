object NQueens {
  def solve(n: Int): List[List[Int]] = {
    def isSafe(placement: List[Int], col: Int): Boolean = {
      val row = placement.length
      placement.zipWithIndex.forall { case (placedCol, placedRow) =>
        placedCol != col && math.abs(placedRow - row) != math.abs(placedCol - col)
      }
    }

    def place(row: Int, placement: List[Int]): List[List[Int]] = {
      if (row == n) List(placement)
      else {
        (0 until n).filter(col => isSafe(placement, col)).flatMap { col =>
          place(row + 1, placement :+ col)
        }.toList
      }
    }

    place(0, Nil)
  }

  def main(args: Array[String]): Unit = {
    val solutions = solve(4)
    println(solutions.length)
    println(solutions.head)
  }
}
