// Aliquot sequence: replace n by the sum of its proper divisors.
fun aliquotSum(n: Int): Int = (1..n / 2).filter { n % it == 0 }.sum()

fun main() {
    val seq = mutableListOf(12)
    while (seq.last() > 1 && seq.size < 20) seq.add(aliquotSum(seq.last()))
    println(seq.joinToString(" "))
}
