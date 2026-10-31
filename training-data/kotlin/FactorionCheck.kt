val fact = intArrayOf(1, 1, 2, 6, 24, 120, 720, 5040, 40320, 362880)

fun isFactorion(n: Int): Boolean = n == n.toString().sumOf { fact[it - '0'] }

fun main() {
    println((1 until 50000).filter(::isFactorion))
}
