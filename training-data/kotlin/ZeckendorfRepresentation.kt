fun zeckendorf(target: Long): List<Long> {
    val fibs = mutableListOf(1L, 2L)
    while (fibs.last() <= target) {
        fibs.add(fibs[fibs.size - 1] + fibs[fibs.size - 2])
    }
    var n = target
    val parts = mutableListOf<Long>()
    for (f in fibs.reversed()) {
        if (f <= n) {
            parts.add(f)
            n -= f
        }
    }
    return parts
}

fun main() {
    println(zeckendorf(100).joinToString(" "))
}
