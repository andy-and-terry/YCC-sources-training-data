fun triangular(): Sequence<Int> = sequence {
    var sum = 0
    var n = 1
    while (true) { sum += n++; yield(sum) }
}

fun main() = println(triangular().take(10).toList())
