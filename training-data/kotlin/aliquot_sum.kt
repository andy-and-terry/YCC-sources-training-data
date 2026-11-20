// Aliquot sum with a when expression.
fun main() {
    for (n in listOf(6, 12, 15, 28)) {
        val a = (1 until n).filter { n % it == 0 }.sum()
        val kind = when {
            a == n -> "perfect"
            a > n -> "abundant"
            else -> "deficient"
        }
        println("$n $a $kind")
    }
}
