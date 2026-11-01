// Ways to write n as a sum of two or more consecutive positive integers.
fun politeWays(n: Int): Int =
    generateSequence(2) { it + 1 }
        .takeWhile { it * (it + 1) / 2 <= n }
        .count { k -> (n - k * (k - 1) / 2) % k == 0 }

fun main() {
    println((1..16).map(::politeWays).joinToString(" "))
}
