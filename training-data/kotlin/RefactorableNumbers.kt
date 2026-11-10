fun tau(n: Int): Int = (1..n).count { n % it == 0 }

fun main() {
    println((1..59).filter { it % tau(it) == 0 }.joinToString(" ")) // 1 2 8 9 12 18 24 36 40 56
}
