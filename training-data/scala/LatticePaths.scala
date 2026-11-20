// Lattice paths with a mutable DP row.
object LatticePaths {
  def lattice(n: Int): Long = {
    val row = Array.fill(n + 1)(1L)
    for (_ <- 1 to n; j <- 1 to n) row(j) += row(j - 1)
    row(n)
  }
  def main(args: Array[String]): Unit = println(lattice(3))
}
