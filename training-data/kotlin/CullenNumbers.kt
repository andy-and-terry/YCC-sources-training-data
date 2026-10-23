fun cullen(n: Int): Long = n * (1L shl n) + 1

fun main() {
    println((0..9).joinToString(" ") { cullen(it).toString() })
}
