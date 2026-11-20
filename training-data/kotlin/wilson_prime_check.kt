// Wilson's theorem primality test.
fun wilson(n: Int): Boolean =
    n >= 2 && (2 until n).fold(1L) { f, i -> f * i % n } == (n - 1).toLong()

fun main() = println((2..19).filter(::wilson))
