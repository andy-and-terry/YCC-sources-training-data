fun golomb(count: Int): List<Int> {
    val g = IntArray(count + 1)
    g[1] = 1
    for (n in 2..count) g[n] = 1 + g[n - g[g[n - 1]]]
    return g.drop(1)
}

fun main() {
    println(golomb(20).joinToString(" "))
}
