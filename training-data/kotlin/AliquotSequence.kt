fun properDivisorSum(n: Int): Int =
    (1..n / 2).filter { n % it == 0 }.sum()

fun main() {
    val seq = generateSequence(12) { if (it == 0) null else properDivisorSum(it) }
    println(seq.joinToString(" "))
}
