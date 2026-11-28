object TwinPrimes extends App {
  val n = 50
  val composite = Array.fill(n + 1)(false)
  for (i <- 2 to math.sqrt(n).toInt if !composite(i); j <- i * i to n by i) composite(j) = true
  println((3 to n - 2).filter(p => !composite(p) && !composite(p + 2)).map(p => (p, p + 2)))
}
