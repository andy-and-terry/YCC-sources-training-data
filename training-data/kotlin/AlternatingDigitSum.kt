fun alternatingDigitSum(n: Int): Int =
    n.toString().reversed().withIndex().sumOf { (i, c) ->
        val d = c - '0'
        if (i % 2 == 0) d else -d
    }

fun main() {
    listOf(1234, 99999, 1000).forEach { println("$it ${alternatingDigitSum(it)}") }
}
