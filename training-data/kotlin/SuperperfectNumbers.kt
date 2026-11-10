fun sigma(n: Int): Int = (1..n).filter { n % it == 0 }.sum()

fun main() {
    println((1..99).filter { sigma(sigma(it)) == 2 * it }.joinToString(" ")) // 2 4 16 64
}
