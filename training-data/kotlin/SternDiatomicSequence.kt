fun stern(count: Int): List<Int> {
    val s = mutableListOf(0, 1)
    for (n in 2 until count) {
        s.add(if (n % 2 == 0) s[n / 2] else s[n / 2] + s[n / 2 + 1])
    }
    return s.take(count)
}

fun main() {
    println(stern(20).joinToString(" "))
}
