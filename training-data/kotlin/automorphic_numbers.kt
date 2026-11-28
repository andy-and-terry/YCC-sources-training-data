fun isAutomorphic(n: Long): Boolean = (n * n).toString().endsWith(n.toString())

fun main() {
    println((0L until 1000L).filter(::isAutomorphic)) // [0, 1, 5, 6, 25, 76, 376, 625]
}
