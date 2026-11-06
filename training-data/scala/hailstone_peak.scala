// Highest value reached by the Collatz (hailstone) sequence from n.
def peak(start: Long): Long =
  Iterator.iterate(start)(n => if n % 2 == 0 then n / 2 else 3 * n + 1)
    .takeWhile(_ != 1).foldLeft(start)(math.max)

@main def hailstonePeak(): Unit =
  println(peak(27))
