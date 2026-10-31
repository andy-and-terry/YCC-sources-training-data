object OddCubesIdentity extends App {
  def cubeFromOdds(n: Long): Long = {
    val start = n * n - n + 1
    (0L until n).map(i => start + 2 * i).sum
  }

  for (n <- 1L to 5L) println(s"$n ${cubeFromOdds(n)} ${cubeFromOdds(n) == n * n * n}")
}
