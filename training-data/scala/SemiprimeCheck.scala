object SemiprimeCheck extends App {
  def primeFactorCount(start: Int): Int = {
    var n = start
    var count = 0
    var p = 2
    while (p * p <= n) {
      while (n % p == 0) { n /= p; count += 1 }
      p += 1
    }
    if (n > 1) count + 1 else count
  }

  println((2 until 30).filter(primeFactorCount(_) == 2))
}
