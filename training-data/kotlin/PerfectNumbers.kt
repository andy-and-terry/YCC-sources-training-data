enum class Classification { PERFECT, ABUNDANT, DEFICIENT }

fun aliquotSum(n: Long): Long {
    if (n == 1L) return 0
    var sum = 1L
    var i = 2L
    while (i * i <= n) {
        if (n % i == 0L) {
            sum += i
            if (i != n / i) sum += n / i
        }
        i++
    }
    return sum
}

fun classify(n: Long): Classification = aliquotSum(n).compareTo(n).let {
    when {
        it == 0 -> Classification.PERFECT
        it > 0 -> Classification.ABUNDANT
        else -> Classification.DEFICIENT
    }
}

fun main() {
    listOf(6L, 12L, 28L, 13L, 8128L).forEach { println("$it ${classify(it)}") }
}
