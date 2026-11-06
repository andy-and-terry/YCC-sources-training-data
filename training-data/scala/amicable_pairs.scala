// Amicable pairs: d(a) == b and d(b) == a with a != b.
def d(n: Int): Int = (1 until n).filter(n % _ == 0).sum

@main def amicablePairs(): Unit =
  for
    a <- 2 until 1500
    b = d(a)
    if b > a && d(b) == a
  do println(s"($a, $b)")
