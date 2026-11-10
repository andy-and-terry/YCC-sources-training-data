object TwinPrimes {
  def main(args: Array[String]): Unit = {
    val limit = 80
    val composite = Array.fill(limit + 1)(false)
    for (i <- 2 to math.sqrt(limit).toInt if !composite(i); j <- i * i to limit by i) composite(j) = true
    val pairs = (3 to limit - 2).filter(p => !composite(p) && !composite(p + 2)).map(p => s"($p,${p + 2})")
    println(pairs.mkString(" ")) // (3,5) (5,7) (11,13) (17,19) (29,31) (41,43) (59,61) (71,73)
  }
}
