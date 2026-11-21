// Keith numbers: n appears in the Fibonacci-like sequence seeded by its digits.
fun isKeith(n: Int): Boolean {
    val seq = n.toString().map { it - '0' }.toMutableList()
    val k = seq.size
    while (seq.last() < n) seq.add(seq.takeLast(k).sum())
    return seq.last() == n
}

fun main() {
    println((10 until 1200).filter(::isKeith).joinToString(" "))
}
