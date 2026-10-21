// Hamming numbers (5-smooth): only prime factors 2, 3 and 5
fun isHamming(start: Int): Boolean {
    var n = start
    for (p in listOf(2, 3, 5)) while (n % p == 0) n /= p
    return n == 1
}

fun main() {
    val found = generateSequence(1) { it + 1 }.filter(::isHamming).take(20).toList()
    println(found.joinToString(" "))
}
