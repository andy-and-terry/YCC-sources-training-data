object SieveOfEratosthenes {
  def sieve(limit: Int): List[Int] = {
    val isPrime = Array.fill(limit + 1)(true)
    isPrime(0) = false
    if (limit >= 1) isPrime(1) = false
    var n = 2
    while (n * n <= limit) {
      if (isPrime(n)) {
        var multiple = n * n
        while (multiple <= limit) {
          isPrime(multiple) = false
          multiple += n
        }
      }
      n += 1
    }
    isPrime.indices.filter(isPrime(_)).toList
  }

  def main(args: Array[String]): Unit = {
    println(sieve(50))
  }
}
