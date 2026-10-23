// Sylvester's sequence: s(0) = 2, s(n+1) = s(n)^2 - s(n) + 1
object SylvesterSequence extends App {
  var s = BigInt(2)
  for (i <- 0 until 8) {
    println(s"s($i) = $s")
    s = s * s - s + 1
  }
}
