fun bucket(n: Int) = when (n) {
    in Int.MIN_VALUE..-1 -> "neg"
    0 -> "zero"
    in 1..9 -> "small"
    else -> "big"
}

fun main() = println(listOf(-3, 0, 5, 50).map(::bucket))
