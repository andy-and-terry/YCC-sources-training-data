fun sieve(limit: Int): List<Int> {
    val isPrime = BooleanArray(limit + 1) { true }
    isPrime[0] = false
    if (limit >= 1) isPrime[1] = false
    var n = 2
    while (n * n <= limit) {
        if (isPrime[n]) {
            var multiple = n * n
            while (multiple <= limit) {
                isPrime[multiple] = false
                multiple += n
            }
        }
        n++
    }
    return isPrime.indices.filter { isPrime[it] }
}

fun main() {
    println(sieve(50))
}
