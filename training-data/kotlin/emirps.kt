// Emirps below 200; expect 15.
fun isPrime(n: Int): Boolean {
    if (n < 2) return false
    var d = 2
    while (d * d <= n) { if (n % d == 0) return false; d++ }
    return true
}

fun main() {
    val found = (2 until 200).filter {
        val r = it.toString().reversed().toInt()
        r != it && isPrime(it) && isPrime(r)
    }
    println("${found.size} $found")
}
