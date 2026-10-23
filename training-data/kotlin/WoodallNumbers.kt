fun woodall(n: Int): Long = n * (1L shl n) - 1

fun main() {
    println((1..10).joinToString(" ") { woodall(it).toString() })
}
